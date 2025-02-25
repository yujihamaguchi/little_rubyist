# frozen_string_literal: true

class Bench
  def lie
    "Lie on the #{style_name} bench."
  end

  def style_name
    raise NotImplementedError
  end
end
