# # frozen_string_literal: true
#
# require_relative "../test_helper"
# require_relative "../../lib/builder/builder/car_body_builder"
#
# class CarBodyBuilderE2eTest < Minitest::Test
#   def test_build_without_engine
#     # Arrange
#     builder = CarBodyBuilder.new
#
#     # Act
#     error = assert_raises(RuntimeError) do
#       builder.with_seats(count: 1).build
#     end
#
#     # Assert
#     assert_equal "engine type is required", error.message
#   end
# end
