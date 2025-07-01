# frozen_string_literal: true

require_relative "fly_behavior"
class FlyWithPropeller
  include FlyBehavior

  def execute
    "Flying with propeller..."
  end
end
