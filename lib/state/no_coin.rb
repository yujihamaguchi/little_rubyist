# frozen_string_literal: true

require "singleton"
require_relative "state"

class NoCoin
  include State
  include Singleton

  def insert_coin(machine:)
    machine.state = HasCoin.instance
  end

  def eject_coin(machine:); end

  def turn_crank(machine:)
    print "Please insert coin before turning the crank."
  end
end
