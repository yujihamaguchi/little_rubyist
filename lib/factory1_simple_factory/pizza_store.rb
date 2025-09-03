# frozen_string_literal: true

class PizzaStore
  def initialize(factory:)
    @factory = factory
  end

  def order(pizza_name)
    pizza = @factory.create(pizza_name)
    pizza.bake.cut.box
  end
end
