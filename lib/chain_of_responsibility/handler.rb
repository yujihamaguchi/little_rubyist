# frozen_string_literal: true

class Handler
  attr_accessor :next_handler

  def handle(leave_request)
    raise NotImplementedError
  end
end
