# frozen_string_literal: true

class Chair
  def sit
    "Sit on the #{self.style} style chair."
  end

  def style
    raise NotImplementedError
  end
end
