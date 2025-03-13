# frozen_string_literal: true

class CarBuilder
  attr_reader :product

  def finalize
    raise "Missing engine attribute" unless product.engine
    raise "Missing seats attribute" unless product.seats

    @product
  end

  def with_seats(count:)
    product.seats = count
    self
  end

  def with_engine(type:)
    product.engine = type
    self
  end

  def with_roof_rails(color:)
    product.roof_rails = color
    self
  end
end
