# frozen_string_literal: true

require_relative "leave_request_handler"

class CEO
  include LeaveRequestHandler

  def handle(leave_request)
    "CEO approved #{leave_request.days}-day leave."
  end

  def next_handler=(_)
    raise "CEO must be the end of the chain"
  end
end
