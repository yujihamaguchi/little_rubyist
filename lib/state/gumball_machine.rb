# frozen_string_literal: true

require_relative "has_coin"
require_relative "no_coin"

class GumballMachine
  attr_accessor :state, :remaining
  attr_reader :monitor

  def initialize(monitor:, remaining: 20)
    @monitor = monitor
    @remaining = remaining
    @state = if @remaining.zero?
               SoldOut.new
             else
               NoCoin.new
             end
  end

  def insert_coin
    state.insert_coin self
  end

  def eject_coin
    state.eject_coin self
  end

  def turn_crank
    state.turn_crank self
  end

  def decrease
    @remaining -= 1
  end
end
