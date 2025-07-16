# frozen_string_literal: true

class Manual
  attr_writer :roof_rails

  def initialize(engine:, seat_count:)
    @engine = engine
    @seat_count = seat_count
  end

  def engine
    "#{@engine.class} equipped"
  end

  def seat
    "#{@seat_count} seats"
  end

  def roof_rails
    return "" unless @roof_rails

    "#{@roof_rails.color} roof rails"
  end
end
