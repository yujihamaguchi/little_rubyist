# frozen_string_literal: true

require_relative "leave_request_handler"

class Manager
  include LeaveRequestHandler

  def handle(leave_request)
    return "Manager approved #{leave_request.days}-day leave." if leave_request.days <= 3

    next_handler.handle(leave_request)
  end
end
