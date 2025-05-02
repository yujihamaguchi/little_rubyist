# frozen_string_literal: true

require_relative "margherita"
require_relative "pepperoni"
class PizzaFactory
  def make(name)
    return Margherita.new if name == :margherita

    Pepperoni.new if name == :pepperoni
  end
end
