# frozen_string_literal: true
require_relative "handler"

class CEO < Handler
  def process(leave_request:)
    "CEO approved #{leave_request.days}-day leave."
  end

  private

  def handleable?(leave_request:)
    leave_request.days > 5
  end
end
