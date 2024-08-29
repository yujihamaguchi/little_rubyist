# frozen_string_literal: true

require "minitest/mock"

class CustomMock < Minitest::Mock
  def hash
    object_id.hash
  end

  def ==(other)
    self.equal?(other)
  end
end
