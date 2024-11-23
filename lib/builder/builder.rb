# frozen_string_literal: true

module Builder
  def with_engine(engine_type:)
    raise NotImplementedError
  end

  def with_seats(seats:)
    raise NotImplementedError
  end

  def result
    raise NotImplementedError
  end
end
