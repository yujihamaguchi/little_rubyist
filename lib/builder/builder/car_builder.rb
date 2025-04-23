# frozen_string_literal: true

class CarBuilder
  def with_seats(count:)
    @seat_count = count
    self
  end

  def with_engine(type:)
    @engine_type = type
    self
  end

  def with_roof_rails(color:)
    @roof_rails_color = color
    self
  end

  def build
    raise "engine type is not specified" if @engine_type.nil?
    raise "seat count is not specified" if @seat_count.nil?
  end
end
