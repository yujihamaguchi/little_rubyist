# frozen_string_literal: true

require_relative "responder"
class CEO < Responder
  def handle(leave_request)
    "CEO approved #{leave_request.days}-day leave."
  end
end
