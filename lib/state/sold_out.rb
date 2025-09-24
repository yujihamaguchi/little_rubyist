# frozen_string_literal: true

require_relative "state"
class SoldOut
  include State
  def insert_coin(machine); end

  def eject_coin(machine); end

  def turn_crank(_machine)
    print "It is sold out, sorry."
  end
end
