# frozen_string_literal: true

require_relative "state"
require_relative "has_coin"

class NoCoin < State
  def eject_coin(machine) end

  def turn_crank(machine)
    machine.monitor.display "Please insert coin before turning the crank."
  end
end
