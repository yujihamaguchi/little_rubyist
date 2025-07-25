# frozen_string_literal: true

class LeaveRequestHandler
  def initialize(next_handler:)
    @next_handler = next_handler
  end

  def handle(leave_request)
    raise NotImplementedError
  end
end
