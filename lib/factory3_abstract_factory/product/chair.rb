# frozen_string_literal: true

class Chair
  def sit
    "Sit on the #{style_name} style chair."
  end

  def style_name
    raise NotImplementedError
  end
end
