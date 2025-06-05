# frozen_string_literal: true

require "singleton"
require_relative "state"

class HasCoin
  include State
  include Singleton

  def insert_coin(machine:); end

  def eject_coin(machine:)
    machine.state = NoCoin.instance
  end

  def turn_crank(machine:)
    print "A gumball come out!"
    machine.state = NoCoin.instance
    machine.decrease_stock
  end
end
