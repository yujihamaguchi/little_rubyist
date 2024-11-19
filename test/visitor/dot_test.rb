# frozen_string_literal: true

require_relative "../test_helper"

class DotTest < Minitest::Test
  def test_accept
    # Arrange
    dot = Dot.new
    visitor = CustomMock.new
    visitor.expect :visit_for_dot, nil, [dot]

    # Act
    dot.accept(visitor: visitor)

    # Assert
    visitor.verify
  end
end
