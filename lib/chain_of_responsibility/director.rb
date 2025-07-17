# frozen_string_literal: true

require_relative "leave_request_handler"
module ChainOfResponsibility
  class Director < LeaveRequestHandler
    def handle(request)
      return "Director approved #{request.days}-day leave." if request.days <= 5

      @next_handler.handle(request)
    end
  end
end
