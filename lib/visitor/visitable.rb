# frozen_string_literal: true

module Visitable
  def accept(visitor)
    raise NotImplementedError
  end
end
