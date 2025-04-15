# frozen_string_literal: true

class GumballMachine
  attr_reader :stock
  attr_accessor :state

  def initialize(stock: 10)
    @state = NoCoin.instance
    self.stock = stock
  end

  def decrease
    self.stock = @stock - 1
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

  private

  def stock=(count)
    @stock = count
    align_state
  end

  def align_state
    @state = SoldOut.instance unless @stock.positive?
  end
end
