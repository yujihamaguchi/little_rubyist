# frozen_string_literal: true

module Shape
  def delegate_to(visitor)
    raise NotImplementedError
  end
end
