# frozen_string_literal: true

require_relative "leave_request_handler"
class Manager < LeaveRequestHandler
  def handle(request)
    return "Manager approved #{request.days}-day leave." if request.days <= 3

    @next_handler.handle(request)
  end
end
