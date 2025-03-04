# frozen_string_literal: true

class SportsCarBuilder
  def with_seats(seat_count:)
    @seat_count = seat_count
    self
  end

  def with_engine(engine_type:)
    @engine_type = engine_type
    self
  end

  def build
    raise NotImplementedError
  end
end
