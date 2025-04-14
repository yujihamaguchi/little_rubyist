# frozen_string_literal: true

require_relative "state"

class SoldOut < State
  def insert_coin(machine:) end

  def eject_coin(machine:) end

  def turn_crank(machine:)
    print "It is sold out, sorry."
  end
end
