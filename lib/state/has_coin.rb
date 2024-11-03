# frozen_string_literal: true

require_relative "state"

class HasCoin < State
  def insert_coin(machine) end

  def eject_coin(machine)
    machine.state = NoCoin.instance
  end

  def turn_crank(machine)
    machine.monitor.display "A gumball come out!"
    machine.decrease
    machine.state = if machine.remaining.zero?
                      SoldOut.instance
                    else
                      NoCoin.instance
                    end
  end
end
