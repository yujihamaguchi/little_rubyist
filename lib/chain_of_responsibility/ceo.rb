# frozen_string_literal: true

require_relative "handler"
class CEO < Handler
  def handle(leave_request)
    "CEO approved #{leave_request.days}-day leave."
  end
end
