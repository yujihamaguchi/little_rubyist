# frozen_string_literal: true

require_relative "./pizza_maker"
require_relative "../factory0_pizza/margherita"
class MargheritaMaker < PizzaMaker
  private

  def create_pizza
    Margherita.new
  end
end
