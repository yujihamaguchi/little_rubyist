# frozen_string_literal: true

module SportsCar
  def engine
    raise NotImplementedError
  end

  def seats
    raise NotImplementedError
  end
end
