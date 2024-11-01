# frozen_string_literal: true

require_relative "state"
require_relative "has_coin"

class SoldOut < State
  def insert_coin(machine) end

  def eject_coin(machine) end

  def turn_crank(machine)
    machine.monitor.display "It is sold out, sorry."
  end
end
