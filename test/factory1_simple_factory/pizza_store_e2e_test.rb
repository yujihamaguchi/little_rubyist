# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/factory1_simple_factory/pizza_store"
require_relative "../../lib/factory1_simple_factory/pizza_factory"
require_relative "../../lib/factory1_simple_factory/margherita"
require_relative "../../lib/factory1_simple_factory/pepperoni"

# クライアントが名指しするだけで、欲しいオブジェクトを得られるようにしたい。クライアントは欲しい具象オブジェクトに依存せず、オブジェクトの生成過程の知識も持たない。
class PizzaStoreE2eTest < Minitest::Test
  def test_order_margherita
    # Arrange
    pizza_store = PizzaStore.new(factory: PizzaFactory.new)

    # Act
    pizza = pizza_store.order(:margherita)

    # Assert
    assert_equal Margherita, pizza.class
    assert pizza.baked?
    assert pizza.cut?
    assert pizza.boxed?
  end

  def test_order_pepperoni
    # Arrange
    pizza_store = PizzaStore.new(factory: PizzaFactory.new)

    # Act
    actual = pizza_store.order(:pepperoni)

    # Assert
    assert_equal Pepperoni, actual.class
    assert actual.baked?
    assert actual.cut?
    assert actual.boxed?
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
