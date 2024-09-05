# frozen_string_literal: true

require "minitest/autorun"

class TestSushiFactory < Minitest::Test
  def test_create_ikura
    # Arrange
    sushi_factory = SushiFactory.new

    # Act
    actual = sushi_factory.create(:Ikura)

    # Assert
    assert_equal Ikura, actual.class
  end
end
