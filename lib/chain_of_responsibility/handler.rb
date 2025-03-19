# frozen_string_literal: true

class Handler
  attr_accessor :next_handler

  def handle(leave_request:)
    return self.process(leave_request: leave_request) if self.handleable?(leave_request: leave_request)

    @next_handler.handle(leave_request: leave_request)
  end

  private

  def handleable?(leave_request:)
    raise NotImplementedError
  end

  def process(leave_request:)
    raise NotImplementedError
  end
end
