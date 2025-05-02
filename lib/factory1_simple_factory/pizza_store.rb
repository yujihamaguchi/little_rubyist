# frozen_string_literal: true

class PizzaStore
  def initialize(factory:)
    @factory = factory
  end

  def order(name)
    pizza = @factory.make(name)
    pizza.bake.cut.box
  end
end
