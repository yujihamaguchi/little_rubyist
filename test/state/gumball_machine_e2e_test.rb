# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/state/gumball_machine"
require_relative "../../lib/state/has_coin"
require_relative "../../lib/state/sold_out"
require_relative "../../lib/state/no_coin"
require_relative "../../lib/state/monitor"

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
    monitor = StatePattern::Monitor.new
    machine = GumballMachine.new(monitor: monitor)
    machine.insert_coin

    # Act
    assert_output("A gumball come out!") { machine.turn_crank }

    # Assert
    assert_equal NoCoin, machine.state.class
  end

  def test_turn_crank_with_no_coin
    # Arrange
    monitor = StatePattern::Monitor.new
    machine = GumballMachine.new(monitor: monitor)

    # Act
    assert_output("Please insert coin before turning the crank.") { machine.turn_crank }

    # Assert
    assert_equal NoCoin, machine.state.class
  end

  def test_turn_crank_when_sold_out
    # Arrange
    monitor = StatePattern::Monitor.new
    machine = GumballMachine.new(monitor: monitor)

    # Act & Assert
    machine.stub :state, SoldOut.instance do
      assert_output("It is sold out, sorry.") { machine.turn_crank }
    end
  end

  def test_turn_crank_on_last_gumball
    # Arrange
    monitor = StatePattern::Monitor.new
    machine = GumballMachine.new(monitor: monitor, remaining: 1)
    machine.insert_coin

    # Act
    assert_output("A gumball come out!") { machine.turn_crank }

    # Assert
    assert_equal SoldOut, machine.state.class
  end

  def test_insert_coin_when_sold_out
    # Arrange
    machine = GumballMachine.new(monitor: nil, remaining: 0)
    assert_equal SoldOut, machine.state.class

    # Act
    machine.insert_coin

    # Assert
    assert_equal SoldOut, machine.state.class
  end

  def test_eject_coin_when_sold_out
    # Arrange
    machine = GumballMachine.new(monitor: nil, remaining: 0)
    assert_equal SoldOut, machine.state.class

    # Act
    machine.eject_coin

    # Assert
    assert_equal SoldOut, machine.state.class
  end
end
