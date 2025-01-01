# frozen_string_literal: true

require_relative "handler"

class StringHandler < Handler
  def handle(request:)
    return "Handled by StringHandler: #{request}" if request.is_a? String

    @next_handler&.handle(request: request)
  end
end
