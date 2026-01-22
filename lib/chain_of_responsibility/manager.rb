# frozen_string_literal: true

require_relative "responder"
class Manager < Responder
  def handle(leave_request)
    return "Manager approved #{leave_request.days}-days leave." if leave_request.days <= 3

    @next_handler.handle(leave_request)
  end
end
