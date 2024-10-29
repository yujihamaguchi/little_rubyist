# frozen_string_literal: true

require_relative "../test_helper"
require "state/gumball_machine"
require "state/has_coin"

class GumballMachineE2eTest < Minitest::Test
  def test_insert_coin
    # Arrange
    machine = GumballMachine.new(monitor: nil)

    # Act
    machine.insert_coin

    # Assert
    assert_equal HasCoin, machine.state.class
  end

  def test_eject_coin
    # Arrange
    machine = GumballMachine.new(monitor: nil)

    # Act
    machine.eject_coin

    # Assert
    assert_equal NoCoin, machine.state.class
  end

  def test_turn_crank
    # Arrange
    monitor = CustomMock.new
    machine = GumballMachine.new(monitor: monitor)
    monitor.expect :display, nil, ["A gumball come out!"]

    # Act
    machine.turn_crank

    # Assert
    monitor.verify
    assert_equal NoCoin, machine.state.class
  end
end
