# frozen_string_literal: true

require_relative "leave_request_handler"
class CEO < LeaveRequestHandler
  def handle(request)
    "CEO approved #{request.days}-day leave."
  end
end
