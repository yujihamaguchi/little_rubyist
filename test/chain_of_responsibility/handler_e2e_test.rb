# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/chain_of_responsibility/validation_handler"
require_relative "../../lib/chain_of_responsibility/transformation_handler"
require_relative "../../lib/chain_of_responsibility/save_handler"

class HandlerE2eTest < Minitest::Test
  def setup
    @validation_handler = ValidationHandler.new
    @transformation_handler = TransformationHandler.new
    @save_handler = SaveHandler.new

    @validation_handler.set_next(handler: @transformation_handler).set_next(handler: @save_handler)
  end

  def test_valid_data
    data = { name: "山田太郎", email: "taro@example.com", age: 30 }
    request = DataRequest.new(data: data)
    @validation_handler.handle(request)

    assert_empty request.errors, "エラーが存在してはならない"
    assert_equal "Adult", request.data[:age_category], "年齢カテゴリが正しく設定されていない"
    assert_includes @save_handler.saved_data, request.data, "データが保存されていない"
  end

  def test_missing_fields
    data = { name: "鈴木花子", email: nil, age: 25 }
    request = DataRequest.new(data: data)
    @validation_handler.handle(request)

    refute_empty request.errors, "エラーが存在すべき"
    assert_includes request.errors, "欠損フィールド: email", "欠損フィールドのエラーが含まれていない"
    assert_empty @save_handler.saved_data, "データが保存されてはいけない"
  end

  def test_non_integer_age
    data = { name: "佐藤次郎", email: "jiro@example.com", age: "三十" }
    request = DataRequest.new(data: data)
    @validation_handler.handle(request)

    refute_empty request.errors, "エラーが存在すべき"
    assert_includes request.errors, "年齢は整数でなければなりません。", "年齢の型エラーが含まれていない"
    assert_empty @save_handler.saved_data, "データが保存されてはいけない"
  end

  def test_invalid_email_format
    data = { name: "高橋一郎", email: "ichiro#example.com", age: 40 }
    request = DataRequest.new(data: data)
    @validation_handler.handle(request)

    refute_empty request.errors, "エラーが存在すべき"
    assert_includes request.errors, "無効なメール形式: ichiro#example.com", "メール形式のエラーが含まれていない"
    assert_empty @save_handler.saved_data, "データが保存されてはいけない"
  end

  def test_multiple_errors
    data = { name: nil, email: "invalid_email", age: "twenty" }
    request = DataRequest.new(data: data)
    @validation_handler.handle(request)

    refute_empty request.errors, "エラーが存在すべき"
    assert_includes request.errors, "欠損フィールド: name", "欠損フィールドのエラーが含まれていない"
    assert_includes request.errors, "無効なメール形式: invalid_email", "メール形式のエラーが含まれていない"
    assert_includes request.errors, "年齢は整数でなければなりません。", "年齢の型エラーが含まれていない"
    assert_empty @save_handler.saved_data, "データが保存されてはいけない"
  end

  def test_age_boundary_child
    data = { name: "子供一", email: "child1@example.com", age: 12 }
    request = DataRequest.new(data: data)
    @validation_handler.handle(request)

    assert_empty request.errors, "エラーが存在してはならない"
    assert_equal "Child", request.data[:age_category], "年齢カテゴリがChildでなければならない"
    assert_includes @save_handler.saved_data, request.data, "データが保存されていない"
  end

  def test_age_boundary_teenager
    data = { name: "ティーン一", email: "teen1@example.com", age: 13 }
    request = DataRequest.new(data: data)
    @validation_handler.handle(request)

    assert_empty request.errors, "エラーが存在してはならない"
    assert_equal "Teenager", request.data[:age_category], "年齢カテゴリがTeenagerでなければならない"
    assert_includes @save_handler.saved_data, request.data, "データが保存されていない"
  end

  def test_age_boundary_senior
    data = { name: "シニア一", email: "senior1@example.com", age: 65 }
    request = DataRequest.new(data: data)
    @validation_handler.handle(request)

    assert_empty request.errors, "エラーが存在してはならない"
    assert_equal "Senior", request.data[:age_category], "年齢カテゴリがSeniorでなければならない"
    assert_includes @save_handler.saved_data, request.data, "データが保存されていない"
  end

  def test_no_handler_can_handle
    # このシナリオでは、SaveHandlerが処理できないようにage_categoryを削除
    data = { name: "山田花子", email: "hanako@example.com", age: 28 }
    request = DataRequest.new(data: data)
    @validation_handler.handle(request)

    # Remove age_category to simulate no handler can handle
    request.data.delete(:age_category)

    # Try to handle again
    @validation_handler.handle(request)

    refute_empty request.errors, "エラーが存在すべき"
    assert_includes request.errors, "リクエストを処理できるハンドラーが見つかりませんでした。", "適切なエラーメッセージが含まれていない"
  end

  def test_save_handler_multiple_saves
    data1 = { name: "ユーザー1", email: "user1@example.com", age: 22 }
    request1 = DataRequest.new(data: data1)
    @validation_handler.handle(request1)

    data2 = { name: "ユーザー2", email: "user2@example.com", age: 17 }
    request2 = DataRequest.new(data: data2)
    @validation_handler.handle(request2)

    data3 = { name: "ユーザー3", email: "user3@example.com", age: 70 }
    request3 = DataRequest.new(data: data3)
    @validation_handler.handle(request3)

    assert_equal 3, @save_handler.saved_data.size, "3つのデータが保存されているべき"
    assert_includes @save_handler.saved_data.map { |d| d[:age_category] }, "Adult", "Adultカテゴリが保存されているべき"
    assert_includes @save_handler.saved_data.map { |d| d[:age_category] }, "Teenager", "Teenagerカテゴリが保存されているべき"
    assert_includes @save_handler.saved_data.map { |d| d[:age_category] }, "Senior", "Seniorカテゴリが保存されているべき"
  end
end
