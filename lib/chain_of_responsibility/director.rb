# frozen_string_literal: true

require_relative "handler"
module ChainOfResponsibility
  class Director < Handler
    def handle(leave_request)
      days = leave_request.days
      return "Director approved #{days}-day leave." if days < 6

      @next_handler.handle(leave_request)
    end
  end
end
