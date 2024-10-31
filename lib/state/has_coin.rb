# frozen_string_literal: true

require_relative "state"

class HasCoin < State
  def turn_crank(gumball_machine)
    gumball_machine.monitor.display "A gumball come out!"
    gumball_machine.state = NoCoin.new
  end
end
