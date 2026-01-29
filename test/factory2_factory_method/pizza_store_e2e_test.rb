# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/factory2_factory_method/pizza_store"
require_relative "../../lib/factory2_factory_method/margherita_factory"
require_relative "../../lib/factory2_factory_method/pepperoni_factory"

# クライアントが種類を指定するだけで、利用可能な状態のオブジェクトを得られるようにしたい。
# クライアントは具象クラスの生成や初期化・加工の過程に依存しない。
# しかも、種類の追加時に既存コードを修正したくない。
module FactoryMethod
  class PizzaStoreE2eTest < Minitest::Test
    def test_order_margherita
      # Arrange
      pizza_store = FactoryMethod::PizzaStore.new(factory: MargheritaFactory.new)

      # Act
      pizza = pizza_store.order

      # Assert
      assert_instance_of Margherita, pizza
      assert pizza.baked?
      assert pizza.cut?
      assert pizza.boxed?
    end

    def test_order_pepperoni
      # Arrange
      pizza_store = FactoryMethod::PizzaStore.new(factory: PepperoniFactory.new)

      # Act
      pizza = pizza_store.order

      # Assert
      assert_instance_of Pepperoni, pizza
      assert pizza.baked?
      assert pizza.cut?
      assert pizza.boxed?
    end
  end
end
