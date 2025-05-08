# frozen_string_literal: true

class Table
  def stand
    "Stand on the #{style_name} style table."
  end

  def style_name
    raise NotImplementedError
  end
end
