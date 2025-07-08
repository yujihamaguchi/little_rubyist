# frozen_string_literal: true

module VisitorAcceptor
  def accept(visitor)
    raise NotImplementedError
  end
end
