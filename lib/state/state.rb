# frozen_string_literal: true

require "singleton"

class State
  include Singleton

  def insert_coin(context:)
    raise NotImplementedError
  end

  def eject_coin(context:)
    raise NotImplementedError
  end

  def turn_crank(context:)
    raise NotImplementedError
  end
end
