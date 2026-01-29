# frozen_string_literal: true

class Pizza
  def initialize
    @baked = false
    @cut = false
    @boxed = false
  end

  def box
    @boxed = true
    self
  end

  def cut
    @cut = true
    self
  end

  def bake
    @baked = true
    self
  end

  def boxed?
    @boxed
  end

  def cut?
    @cut
  end

  def baked?
    @baked
  end
end
