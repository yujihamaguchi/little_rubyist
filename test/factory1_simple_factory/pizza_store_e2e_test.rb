# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/factory1_simple_factory/pizza_store"
require_relative "../../lib/factory1_simple_factory/pizza_factory"
require_relative "../../lib/factory0_pizza/margherita"
require_relative "../../lib/factory0_pizza/pepperoni"

# クライアントが種類を指定するだけで、利用可能な状態のオブジェクトを得られるようにしたい。
# クライアントは具象クラスの生成や初期化・加工の過程に依存しない。
class PizzaStoreE2eTest < Minitest::Test
  def test_order_margherita
    # Arrange
    pizza_store = PizzaStore.new(factory: PizzaFactory.new)

    # Act
    pizza = pizza_store.order(:margherita)

    # Assert
    assert_instance_of Margherita, pizza
    assert pizza.baked?
    assert pizza.cut?
    assert pizza.boxed?
  end

  def test_order_pepperoni
    # Arrange
    pizza_store = PizzaStore.new(factory: PizzaFactory.new)

    # Act
    pizza = pizza_store.order(:pepperoni)

    # Assert
    assert_instance_of Pepperoni, pizza
    assert pizza.baked?
    assert pizza.cut?
    assert pizza.boxed?
  end

  def test_order_unsupported_pizza
    # Arrange
    pizza_store = PizzaStore.new(factory: PizzaFactory.new)

    # Act & Assert
    assert_raises(ArgumentError) do
      pizza_store.order(:unsupported_pizza)
    end
  end
end
