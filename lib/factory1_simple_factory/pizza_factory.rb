# frozen_string_literal: true

require_relative "../factory0_pizza/margherita"
require_relative "../factory0_pizza/pepperoni"

class PizzaFactory
  def create(name)
    case name
    when :margherita then Margherita.new
    when :pepperoni then Pepperoni.new
    else raise ArgumentError
    end
  end
end
