# frozen_string_literal: true

require_relative "visitor_acceptor"
class Dot
  include VisitorAcceptor
  attr_reader :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def accept(visitor)
    visitor.visit_dot(self)
  end
end
