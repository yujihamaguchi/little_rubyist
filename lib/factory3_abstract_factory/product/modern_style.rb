# frozen_string_literal: true

require_relative "furniture_style"
module ModernStyle
  include FurnitureStyle
  def style
    "modern"
  end
end
