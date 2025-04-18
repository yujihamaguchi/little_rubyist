# frozen_string_literal: true

module Shape
  def accept(visitor)
    raise NotImplementedError
  end
end
