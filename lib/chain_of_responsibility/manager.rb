# frozen_string_literal: true
require_relative "handler"

class Manager < Handler
  def process(leave_request:)
    "Manager approved #{leave_request.days}-day leave."
  end

  private

  def handleable?(leave_request:)
    leave_request.days <= 3
  end
end
