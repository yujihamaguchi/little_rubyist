# frozen_string_literal: true

require_relative "visitor_acceptor"
class Circle
  include VisitorAcceptor
  attr_reader :x, :y, :r

  def initialize(x:, y:, r:)
    @x = x
    @y = y
    @r = r
  end

  def accept(visitor)
    visitor.visit_circle(self)
  end
end
