# frozen_string_literal: true
require_relative "handler"

module ChainOfResponsibility
  class Director < Handler
    def process(leave_request:)
      "Director approved #{leave_request.days}-day leave."
    end

    private

    def handleable?(leave_request:)
      leave_request.days <= 5
    end

  end
end
