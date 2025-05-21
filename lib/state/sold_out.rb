# frozen_string_literal: true

require "singleton"
require_relative "state"
class SoldOut
  include State
  include Singleton
  def insert_coin(machine:); end

  def eject_coin(machine:); end

  def turn_crank(machine:)
    print "It is sold out, sorry."
  end
end
