# frozen_string_literal: true

class CarBuilder
  def product
    raise RuntimeError unless @product.engine
    raise RuntimeError unless @product.seats

    @product
  end

  def with_seats(count:)
    @product.seats = count
    self
  end

  def with_engine(type:)
    @product.engine = type
    self
  end
end
