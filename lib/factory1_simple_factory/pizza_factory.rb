# frozen_string_literal: true

require_relative "margherita"
class PizzaFactory
  def create(pizza_name)
    return Margherita.new if pizza_name == :margherita
    return Pepperoni.new if pizza_name == :pepperoni

    raise ArgumentError
  end
end
