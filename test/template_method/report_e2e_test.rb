# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/template_method/report"
# ひとセットの共通処理を行いたいが、処理の中身にバリエーションをもたせたい。クライアントはオブジェクトの種類を選択するのみとしたい。

class ReportE2eTest < Minitest::Test
  def test_generate
    # Arrange
    report = Report.new

    fetched = CustomMock.new
    formatted = CustomMock.new

    report.define_singleton_method(:fetch) { fetched }

    argument = nil
    report.define_singleton_method(:format) do |raw_data|
      argument = raw_data
      formatted
    end

    # Act
    result = report.generate

    # Assert
    assert_equal fetched, argument
    assert_equal formatted, result
  end

  def test_fetch_data
    # Arrange
    report = Report.new

    # Act
    output = report.send(:fetch)

    # Assert
    assert_equal %i[foo bar baz], output
  end
end
