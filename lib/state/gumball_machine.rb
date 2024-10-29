# frozen_string_literal: true

require_relative "has_coin"
require_relative "no_coin"

class GumballMachine
  attr_reader :state

  def initialize(monitor:)
    @monitor = monitor
  end

  def insert_coin
    @state = HasCoin.new
  end

  def eject_coin
    @state = NoCoin.new
  end

  def turn_crank
    @state = NoCoin.new
    @monitor.display "A gumball come out!"
  end
end
