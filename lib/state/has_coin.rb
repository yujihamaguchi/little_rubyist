# frozen_string_literal: true

require_relative "state"
class HasCoin
  include State
  def insert_coin(machine); end

  def eject_coin(machine)
    machine.state = NoCoin.new
  end

  def turn_crank(machine)
    print "A gumball come out!"
    machine.state = NoCoin.new
    machine.decrease_stock
  end
end
