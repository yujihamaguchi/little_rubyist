# frozen_string_literal: true

class Table
  def stand
    "Stand on the #{self.style} style table."
  end

  private

  def style
    raise NotImplementedError
  end
end
