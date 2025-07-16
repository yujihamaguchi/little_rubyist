# frozen_string_literal: true

module CarBuilder
  def with_engine(engine)
    raise NotImplementedError
  end

  def with_seat(count: 2)
    raise NotImplementedError
  end

  def with_roof_rails(roof_rails)
    raise NotImplementedError
  end

  def build
    raise NotImplementedError
  end
end
