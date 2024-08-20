# frozen_string_literal: true

require_relative "fly_behavior"

class FlyNoWay
  include FlyBehavior

  def fly
    "No way!"
  end
end
