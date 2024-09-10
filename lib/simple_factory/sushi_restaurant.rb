# frozen_string_literal: true

class SushiRestaurant
  def initialize(factory:)
    @factory = factory
  end

  def order(symbol)
    sushi = @factory.create(symbol)
    sushi.prepare.box
  end
end
