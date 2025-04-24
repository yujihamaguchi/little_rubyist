# frozen_string_literal: true

module LeaveRequestHandler
  attr_accessor :next_handler

  def handle(leave_request)
    raise NotImplementedError
  end
end
