# frozen_string_literal: true

require_relative "has_coin"
require_relative "no_coin"

class GumballMachine
  attr_accessor :state
  attr_reader :monitor, :remaining

  def initialize(monitor:)
    @remaining = 20
    @monitor = monitor
    @state = NoCoin.new
  end

  def insert_coin
    @state = HasCoin.new
  end

  def eject_coin
    @state = NoCoin.new
  end

  def turn_crank
    @state.turn_crank self
  end
end
