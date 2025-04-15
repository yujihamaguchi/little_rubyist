# frozen_string_literal: true

require_relative "fly_behavior"

class FlyWithWings
  include FlyBehavior

  def behave
    "Flying with wings..."
  end
end
