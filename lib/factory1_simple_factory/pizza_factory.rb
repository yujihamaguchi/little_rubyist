# frozen_string_literal: true

require_relative "margherita"
class PizzaFactory
  def create(name)
    case name
    when :margherita
      Margherita.new
    when :pepperoni
      Pepperoni.new
    else
      raise ArgumentError
    end
  end
end
