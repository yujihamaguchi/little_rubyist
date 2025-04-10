# frozen_string_literal: true

require_relative "margherita"
require_relative "pepperoni"

class PizzaStore
  def initialize(factory:)
    @factory = factory
  end

  def order(name)
    pizza = @factory.create_pizza(name)
    pizza.bake.cut.box
  end
end
