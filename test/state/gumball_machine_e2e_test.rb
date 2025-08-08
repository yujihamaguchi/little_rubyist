# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/state/gumball_machine"

# オブジェクトの内部状態によって振る舞いを切り替えたいが、if 文や switch 文などの多重条件分岐を使うことで、コードが冗長化・複雑化するのを避けたい。
class GumballMachineE2eTest < Minitest::Test
  def test_insert_coin
    # Arrange
    machine = GumballMachine.new
    assert_equal NoCoin, machine.state.class

    # Act
    machine.insert_coin

    # Assert
    assert_equal HasCoin, machine.state.class
  end

  def test_eject_coin
    # Arrange
    machine = GumballMachine.new
    machine.insert_coin
    assert_equal HasCoin, machine.state.class

    # Act
    machine.eject_coin

    # Assert
    assert_equal NoCoin, machine.state.class
  end

  def test_insert_coin_with_has_coin
    # Arrange
    machine = GumballMachine.new
    machine.insert_coin
    assert_equal HasCoin, machine.state.class

    # Act
    machine.insert_coin

    # Assert
    assert_equal HasCoin, machine.state.class
  end

  def test_eject_coin_with_no_coin
    # Arrange
    machine = GumballMachine.new
    assert_equal NoCoin, machine.state.class

    # Act
    machine.eject_coin

    # Assert
    assert_equal NoCoin, machine.state.class
  end

  def test_turn_crank
    # Arrange
    machine = GumballMachine.new
    assert_equal 10, machine.stock
    machine.insert_coin

    # Act & Assert
    assert_output("A gumball come out!") { machine.turn_crank }
    assert_equal 9, machine.stock
    assert_equal NoCoin, machine.state.class
  end

  def test_turn_crank_with_no_coin
    # Arrange
    machine = GumballMachine.new
    assert_equal 10, machine.stock
    assert_equal NoCoin, machine.state.class

    # Act & Assert
    assert_output("Please insert coin before turning the crank.") { machine.turn_crank }
    assert_equal NoCoin, machine.state.class
    assert_equal 10, machine.stock
  end

  def test_turn_crank_on_last_gumball
    # Arrange
    machine = GumballMachine.new(stock: 1)
    machine.insert_coin

    # Act
    assert_output("A gumball come out!") { machine.turn_crank }

    # Assert
    assert_equal SoldOut, machine.state.class
  end

  def test_turn_crank_when_sold_out
    # Arrange
    machine = GumballMachine.new(stock: 0)
    assert_equal 0, machine.stock

    # Act & Assert
    assert_output("It is sold out, sorry.") { machine.turn_crank }
  end

  def test_insert_coin_when_sold_out
    # Arrange
    machine = GumballMachine.new(stock: 0)
    assert_equal SoldOut, machine.state.class

    # Act
    machine.insert_coin

    # Assert
    assert_equal SoldOut, machine.state.class
  end

  def test_eject_coin_when_sold_out
    # Arrange
    machine = GumballMachine.new(stock: 0)
    assert_equal SoldOut, machine.state.class

    # Act
    machine.eject_coin

    # Assert
    assert_equal SoldOut, machine.state.class
  end
end
