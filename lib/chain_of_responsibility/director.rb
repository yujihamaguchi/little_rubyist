# frozen_string_literal: true
require_relative "handler"

module ChainOfResponsibility
  class Director < Handler
    def handle(leave_request:)
      "Director approved #{leave_request.days}-day leave."
    end
  end
end
