# frozen_string_literal: true

require_relative "fly_behavior"

class FlyNoWay
  include FlyBehavior

  def behave
    "No way!"
  end
end
