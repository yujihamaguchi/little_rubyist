# frozen_string_literal: true

class PizzaStore
  def order(name)
    pizza = self.create_pizza(name)
    pizza.bake
         .cut
         .box
  end

  private

  def create_pizza(name)
    case name
    when :margherita then Margherita.new
    when :pepperoni then Pepperoni.new
    else raise ArgumentError
    end
  end
end
