# frozen_string_literal: true

require_relative "responder"
class GeneralManager < Responder
  def handle(leave_request)
    return "General manager approved #{leave_request.days}-days leave." if leave_request.days <= 5

    @next_handler.handle(leave_request)
  end
end
