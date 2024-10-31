# frozen_string_literal: true

require_relative "../test_helper"
require "state/gumball_machine"
require "state/has_coin"
require "state/sold_out"
require "state/no_coin"

class GumballMachineE2eTest < Minitest::Test
  def test_insert_coin
    # Arrange
    machine = GumballMachine.new(monitor: nil)
    assert_equal NoCoin, machine.state.class

    # Act
    machine.insert_coin

    # Assert
    assert_equal HasCoin, machine.state.class
  end

  def test_eject_coin
    # Arrange
    machine = GumballMachine.new(monitor: nil)
    machine.insert_coin
    assert_equal HasCoin, machine.state.class

    # Act
    machine.eject_coin

    # Assert
    assert_equal NoCoin, machine.state.class
  end

  def test_turn_crank
    # Arrange
    monitor = CustomMock.new
    monitor.expect :display, nil, ["A gumball come out!"]
    machine = GumballMachine.new(monitor: monitor)
    machine.insert_coin

    # Act
    machine.turn_crank

    # Assert
    monitor.verify
    assert_equal NoCoin, machine.state.class
  end

  def test_turn_crank_with_no_coin
    # Arrange
    monitor = CustomMock.new
    monitor.expect :display, nil, ["Please insert coin before turning the crank."]
    machine = GumballMachine.new(monitor: monitor)

    # Act
    machine.turn_crank

    # Assert
    monitor.verify
    assert_equal NoCoin, machine.state.class
  end

  def test_turn_crank_when_sold_out
    # Arrange
    monitor = CustomMock.new
    monitor.expect :display, nil, ["It is sold out, sorry."]
    machine = GumballMachine.new(monitor: monitor)

    # Act
    machine.stub :state, SoldOut.new do
      machine.turn_crank
    end

    # Assert
    monitor.verify
  end

  def test_turn_crank_on_last_gumball
    # Arrange
    monitor = CustomMock.new
    monitor.expect :display, nil, ["A gumball come out!"]
    machine = GumballMachine.new(monitor: monitor, remaining: 1)
    machine.insert_coin

    # Act
    machine.turn_crank

    # Assert
    assert_equal SoldOut, machine.state.class
  end
end
