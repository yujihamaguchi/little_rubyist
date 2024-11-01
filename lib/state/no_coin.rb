# frozen_string_literal: true

require_relative "state"
require_relative "has_coin"

class NoCoin < State
  def insert_coin(machine)
    machine.state = HasCoin.new
  end

  def eject_coin(machine) end

  def turn_crank(machine)
    machine.monitor.display "Please insert coin before turning the crank."
  end
end
