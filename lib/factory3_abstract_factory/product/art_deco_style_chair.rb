# frozen_string_literal: true

require_relative "chair"
require_relative "style"

class ArtDecoStyleChair < Chair
  include Style::ArtDeco
end
