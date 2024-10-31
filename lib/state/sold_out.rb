# frozen_string_literal: true

require_relative "state"
require_relative "has_coin"

class SoldOut < State
  def turn_crank(machine)
    machine.monitor.display "It is sold out, sorry."
  end
end
