# # frozen_string_literal: true
#
# require "minitest/autorun"
#
# class CarBuilderE2eTest < Minitest::Test
#   def setup
#     @car_builder = SportsCarBodyBuilder.new
#   end
#
#   def test_build_without_engine
#     error = assert_raises(RuntimeError) do
#       @car_builder.with_seats(seat_count: 2).build
#     end
#     assert_match(/Engine is missing/, error.message)
#   end
#
#   def test_build_without_seats
#     error = assert_raises(RuntimeError) do
#       @car_builder.with_engine(engine_type: "some engine").build
#     end
#     assert_match(/Seats is missing/, error.message)
#   end
# end
