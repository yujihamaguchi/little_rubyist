# frozen_string_literal: true

require_relative "state"
class NoCoin < State
  def insert_coin(context:)
    context.state = HasCoin.instance
  end

  def eject_coin(context:); end

  def turn_crank(context:)
    print "Please insert coin before turning the crank."
  end
end
