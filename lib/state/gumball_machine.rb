# frozen_string_literal: true

require_relative "no_coin"
require_relative "has_coin"
require_relative "sold_out"
class GumballMachine
  attr_reader :stock
  attr_accessor :state

  def initialize(stock: 10)
    @stock = stock
    @state = @stock.zero? ? SoldOut.instance : NoCoin.instance
  end

  def decrease
    @stock -= 1
  end

  def insert_coin
    @state.insert_coin(context: self)
  end

  def eject_coin
    @state.eject_coin(context: self)
  end

  def turn_crank
    @state.turn_crank(context: self)
  end
end
