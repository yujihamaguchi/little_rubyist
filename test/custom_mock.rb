# frozen_string_literal: true

require "minitest/mock"

class CustomMock < Minitest::Mock
  def hash
    object_id.hash
  end

  def ==(other)
    self.object_id == other.object_id
  end
end
