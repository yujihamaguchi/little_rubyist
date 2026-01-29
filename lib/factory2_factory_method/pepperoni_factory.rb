# frozen_string_literal: true

require_relative "./pizza_factory"
require_relative "../factory0_pizza/pepperoni"
module FactoryMethod
  class PepperoniFactory
    include PizzaFactory

    def create
      Pepperoni.new
    end
  end
end
