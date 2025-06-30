# frozen_string_literal: true

require_relative "no_coin"
require_relative "sold_out"

class GumballMachine
  attr_accessor :state
  attr_reader :stock

  def initialize(stock: 10)
    @state = NoCoin.instance
    self.stock = stock
  end

  def decrease_stock
    self.stock = @stock - 1
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

  private

  def stock=(count)
    @stock = count
    @state = SoldOut.instance if @stock.zero?
  end
end
