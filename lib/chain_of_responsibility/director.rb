# frozen_string_literal: true

require_relative "leave_request_handler"

module ChainOfResponsibility
  class Director
    include LeaveRequestHandler

    def handle(leave_request)
      return "Director approved #{leave_request.days}-day leave." if leave_request.days <= 5

      next_handler.handle(leave_request)
    end
  end
end
