# frozen_string_literal: true

class PizzaStore
  def initialize(factory:)
    @factory = factory
  end

  def order(name)
    @factory.create(name).bake.cut.box
  end
end
