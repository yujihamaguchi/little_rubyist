# frozen_string_literal: true

require_relative "margherita"
require_relative "pepperoni"
class PizzaFactory
  def create(name)
    return Margherita.new if name == :margherita

    return Pepperoni.new if name == :pepperoni

    raise RuntimeError
  end
end
