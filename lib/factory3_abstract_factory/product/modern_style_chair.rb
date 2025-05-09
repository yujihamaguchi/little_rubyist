# frozen_string_literal: true

require_relative "chair"
require_relative "style"

class ModernStyleChair < Chair
  include Style::Modern
end
