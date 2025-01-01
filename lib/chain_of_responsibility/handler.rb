# frozen_string_literal: true

class Handler
  def set_next_handler(handler:)
    @next_handler = handler
  end

  def handle(request:)
    raise NotImplementedError
  end
end
