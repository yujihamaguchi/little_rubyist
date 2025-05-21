# frozen_string_literal: true

require_relative "no_coin"
require_relative "has_coin"
class GumballMachine
  attr_reader :stock
  attr_accessor :state

  def initialize(stock: 10)
    @state = if stock.zero?
               SoldOut.instance
             else
               NoCoin.instance
             end

    @stock = stock
  end

  def insert_coin
    @state.insert_coin(machine: self)
  end

  def eject_coin
    @state.eject_coin(machine: self)
  end

  def turn_crank
    @state.turn_crank(machine: self)
  end

  def decrease_stock
    @stock -= 1
    @state = SoldOut.instance if @stock.zero?
  end
end
