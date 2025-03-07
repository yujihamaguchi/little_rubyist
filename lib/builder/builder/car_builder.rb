# frozen_string_literal: true

class CarBuilder
  def build
    raise NotImplementedError
  end

  def with_engine(type:)
    @type = type
    self
  end

  def with_seats(count:)
    @count = count
    self
  end
end
