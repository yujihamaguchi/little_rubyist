# frozen_string_literal: true

module FactoryMethod
  class PizzaStore
    def initialize(factory:)
      @factory = factory
    end

    def order
      @factory.create
              .bake
              .cut
              .box
    end
  end
end
