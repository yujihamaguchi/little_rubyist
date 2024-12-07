# frozen_string_literal: true

module Builder
  def with_engine(engine_type:)
    raise NotImplementedError
  end

  def with_seats(seats:)
    raise NotImplementedError
  end

  def with_roof_rails(color:)
    raise NotImplementedError
  end

  def build
    raise NotImplementedError
  end
end
