# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/factory2_factory_method/nigiri_sushi_store"
require_relative "../../lib/factory2_factory_method/nigiri_sushi_platter"
require_relative "../../lib/factory2_factory_method/maki_sushi_store"
require_relative "../../lib/factory2_factory_method/maki_sushi_platter"
# 生成される具体的なクラスに依存せずに、共通の処理フローを維持しつつ、バリエーションの追加に柔軟に対応したい。
class SushiStoreE2eTest < Minitest::Test
  def test_order_nigiri_set
    # Arrange
    store = NigiriSushiStore.new

    # Act
    platter = store.order

    # Assert
    assert_instance_of NigiriSushiPlatter, platter
    assert platter.selection.include?(:maguro)
    assert platter.selection.include?(:salmon)
    assert platter.plated?
    assert platter.packed?
  end

  def test_order_maki_set
    store = MakiSushiStore.new
    platter = store.order

    assert_instance_of MakiSushiPlatter, platter
    assert platter.selection.include?(:tekka_maki)
    assert platter.selection.include?(:kappa_maki)
    assert platter.plated?
    assert platter.packed?
  end
end
