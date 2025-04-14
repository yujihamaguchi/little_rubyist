# frozen_string_literal: true

require_relative "state"

class HasCoin < State
  def insert_coin(machine:) end

  def eject_coin(machine:)
    machine.state = NoCoin.instance
  end

  def turn_crank(machine:)
    print "A gumball come out!"
    machine.state = NoCoin.instance
    machine.decrease
  end
end
