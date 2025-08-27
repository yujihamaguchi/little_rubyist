# frozen_string_literal: true

require_relative "responder"
class GeneralManager < Responder
  def handle(leave_request)
    days = leave_request.days
    return "General manager approved #{days}-day leave." if days < 6

    @next_handler.handle(leave_request)
  end
end
