# frozen_string_literal: true

require_relative "no_coin"
require_relative "has_coin"
require_relative "sold_out"
class GumballMachine
  attr_reader :stock
  attr_accessor :state

  def initialize(stock: 10)
    @state = NoCoin.instance
    self.stock = stock
  end

  def stock=(count)
    @stock = count
    @state = SoldOut.instance unless @stock.positive?
  end

  def decrease_stock
    self.stock -= 1
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
end
