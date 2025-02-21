# frozen_string_literal: true

require "minitest/autorun"

# 複雑なオブジェクト生成過程を段階的に行いたい（ついでに複雑な生成過程を担う Builder を差し替えて様々なものを生成したい）
class CarBuilderE2eTest < Minitest::Test
  def setup
    @car_builder = CarBuilder.new
  end

  def test_build_without_engine
    error = assert_raises(RuntimeError) do
      @car_builder.with_seats(seat_count: 2).build
    end
    assert_match(/Engine is missing/, error.message)
  end

  def test_build_without_seats
    error = assert_raises(RuntimeError) do
      @car_builder.with_engine(engine_type: "some engine").build
    end
    assert_match(/Seats is missing/, error.message)
  end
end
