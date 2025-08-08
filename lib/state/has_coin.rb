# frozen_string_literal: true

require_relative "state"
class HasCoin < State
  def insert_coin(context:); end

  def eject_coin(context:)
    context.state = NoCoin.instance
  end

  def turn_crank(context:)
    print "A gumball come out!"
    context.decrease
    context.state = context.stock.zero? ? SoldOut.instance : NoCoin.instance
  end
end
