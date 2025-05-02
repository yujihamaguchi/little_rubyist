# frozen_string_literal: true

class Pizza
  def boxed?
    @boxed
  end

  def cut?
    @cut
  end

  def baked?
    @baked
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

  def initialize
    @baked = false
    @cut = false
    @boxed = false
  end
end
