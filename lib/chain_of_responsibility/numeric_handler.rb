# frozen_string_literal: true

require_relative "handler"

class NumericHandler < Handler
  def handle(request:)
    return "Handled by NumericHandler: #{request}" if request.is_a? Numeric

    @next_handler&.handle(request: request)
  end
end
