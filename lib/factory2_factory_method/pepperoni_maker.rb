# frozen_string_literal: true

require_relative "./pizza_maker"
require_relative "../factory0_pizza/pepperoni"
class PepperoniMaker < PizzaMaker
  private

  def create_pizza
    Pepperoni.new
  end
end
