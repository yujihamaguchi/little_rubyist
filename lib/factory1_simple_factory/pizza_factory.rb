# frozen_string_literal: true

require_relative "margherita"
require_relative "pepperoni"

class PizzaFactory
  def create_pizza(name)
    case name
    in :margherita
      Margherita.new
    in :pepperoni
      Pepperoni.new
    end
  end
end
