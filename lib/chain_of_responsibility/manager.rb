# frozen_string_literal: true

require_relative "handler"
class Manager < Handler
  def handle(leave_request)
    days = leave_request.days
    return "Manager approved #{days}-day leave." if days <= 3

    @next_handler.handle(leave_request)
  end
end
