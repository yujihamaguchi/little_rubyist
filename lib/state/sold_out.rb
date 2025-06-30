# frozen_string_literal: true

require_relative "state"
class SoldOut < State
  def insert_coin(context:); end

  def eject_coin(context:); end

  def turn_crank(context:)
    print "It is sold out, sorry."
  end
end
