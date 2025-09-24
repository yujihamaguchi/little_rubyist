# frozen_string_literal: true

require_relative "no_coin"
require_relative "has_coin"
require_relative "sold_out"
class GumballMachine
  attr_accessor :state
  attr_reader :stock

  def initialize(stock: 10)
    @state = NoCoin.new
    @stock = stock
    self.reset_state
  end

  def insert_coin
    @state.insert_coin(self)
  end

  def eject_coin
    @state.eject_coin(self)
  end

  def turn_crank
    @state.turn_crank(self)
  end

  def decrease_stock
    @stock -= 1
    self.reset_state
  end

  private

  def reset_state
    @state = SoldOut.new if @stock.zero?
  end
end
