# frozen_string_literal: true

require_relative "builder"
require_relative "manual"

class ManualBuilder
  include Builder
  attr_reader :manual

  def initialize
    @manual = Manual.new
  end

  def engine(engine)
    @manual.engine = "#{engine} manual"
  end

  def seats(seats)
    @manual.seats = "#{seats} seats"
  end

  def product
    @manual
  end
end
