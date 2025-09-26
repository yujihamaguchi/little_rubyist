# frozen_string_literal: true

require_relative "state"
require_relative "has_coin"
class NoCoin < State
  def insert_coin(context)
    context.state = HasCoin.instance
  end

  def eject_coin(context); end

  def turn_crank(_context)
    print "Please insert coin before turning the crank."
  end
end
