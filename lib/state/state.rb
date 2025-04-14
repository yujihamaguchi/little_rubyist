# frozen_string_literal: true

require "singleton"

class State
  include Singleton

  def insert_coin(machine:)
    raise NotImplementedError
  end

  def eject_coin(machine:)
    raise NotImplementedError
  end

  def turn_crank(machine:)
    raise NotImplementedError
  end
end
