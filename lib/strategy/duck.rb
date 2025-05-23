# frozen_string_literal: true

class Duck
  def initialize(fly_behavior:)
    @fly_behavior = fly_behavior
  end

  def fly
    @fly_behavior.execute
  end
end
