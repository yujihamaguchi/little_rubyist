# frozen_string_literal: true

require_relative "state"

class NoCoin < State
  def turn_crank(gumball_machine)
    gumball_machine.monitor.display "Please insert coin before turning the crank."
    gumball_machine.state = NoCoin.new
  end
end
