# frozen_string_literal: true

class CarProduct
  def initialize(engine:, seats:, roof_rails: nil)
    @engine = engine
    @seats = seats
    @roof_rails = roof_rails
  end
end
