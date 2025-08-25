# frozen_string_literal: true

module CarBuilder
  def with_roof_rails(roof_rails)
    @roof_rails = roof_rails
    self
  end

  def with_seats(seats)
    @seats = seats
    self
  end

  def with_engine(engine)
    @engine = engine
    self
  end

  def build
    raise NotImplementedError
  end
end
