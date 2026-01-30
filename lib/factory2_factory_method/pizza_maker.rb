# frozen_string_literal: true

class PizzaMaker
  def order
    self.create_pizza
        .bake
        .cut
        .box
  end

  private

  def create_pizza
    raise NotImplementedError
  end
end
