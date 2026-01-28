# frozen_string_literal: true

require_relative "margherita"
require_relative "pepperoni"

class PizzaFactory
  def create(name)
    case name
    when :margherita then Margherita.new
    when :pepperoni then Pepperoni.new
    else raise ArgumentError
    end
  end
end
