# frozen_string_literal: true

require_relative "./pizza_factory"
require_relative "../factory0_pizza/margherita"
module FactoryMethod
  class MargheritaFactory
    include PizzaFactory
    def create
      Margherita.new
    end
  end
end
