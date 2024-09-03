# frozen_string_literal: true

class Ikura
  def prepared?
    raise NotImplementedError
  end

  def boxed?
    raise NotImplementedError
  end

  def prepare
    raise NotImplementedError
  end

  def box
    raise NotImplementedError
  end
end
