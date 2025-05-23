# frozen_string_literal: true

require_relative "fly_behavior"
class FlyWithWings
  include FlyBehavior
  def execute
    "Flying with wings..."
  end
end
