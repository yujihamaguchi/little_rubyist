# frozen_string_literal: true

class State
  def insert_coin(machine)
    machine.state = HasCoin.new
  end

  def eject_coin(machine)
    machine.state = NoCoin.new
  end

  def turn_crank(machine)
    raise NotImplementedError
  end
end
