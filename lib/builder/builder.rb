# frozen_string_literal: true

module Builder
  def engine(engine:)
    raise NotImplementedError
  end

  def seats(seats:)
    raise NotImplementedError
  end

  def result
    raise NotImplementedError
  end
end
