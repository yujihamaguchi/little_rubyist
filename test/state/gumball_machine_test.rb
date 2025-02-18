# frozen_string_literal: true

require "minitest/autorun"

class GumballMachineTest < Minitest::Test
  def test_insert_coin
    # Arrange
    machine = GumballMachine.new(monitor: nil)
    state = CustomMock.new

    state.expect :insert_coin, nil, [machine]

    # Act
    machine.stub(:state, state) do
      machine.insert_coin
    end

    # Assert
    state.verify
  end
end
