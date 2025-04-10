# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/factory1_simple_factory/pizza_store"
require_relative "../../lib/factory1_simple_factory/pizza_factory"
require_relative "../../lib/factory1_simple_factory/margherita"
require_relative "../../lib/factory1_simple_factory/pepperoni"

# クライアントから、オブジェクトや匿名関数などのカプセル化されたロジックがどのように生成されているかを隠蔽したい
class PizzaStoreE2eTest < Minitest::Test
  def test_order_margherita
    # Arrange
    pizza_store = PizzaStore.new(factory: PizzaFactory.new)

    # Act
    actual = pizza_store.order(:margherita)

    # Assert
    assert_equal Margherita, actual.class
    assert actual.baked?
    assert actual.cut?
    assert actual.boxed?
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
end
