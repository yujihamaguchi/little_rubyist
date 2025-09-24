# frozen_string_literal: true

require_relative "state"
require_relative "has_coin"
class NoCoin
  include State
  def insert_coin(machine)
    machine.state = HasCoin.new
  end

  def eject_coin(machine); end

  def turn_crank(_machine)
    print "Please insert coin before turning the crank."
  end
end
