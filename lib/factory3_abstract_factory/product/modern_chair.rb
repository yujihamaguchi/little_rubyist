# frozen_string_literal: true

require_relative "chair"
require_relative "modern_style"
class ModernChair < Chair
  include ModernStyle
end
