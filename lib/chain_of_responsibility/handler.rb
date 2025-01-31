# frozen_string_literal: true

class Handler
  def set_next_handler(handler:)
    @next_handler = handler
  end

  def handle(request:)
    updated_request = do_handle(request: request)

    if @next_handler
      @next_handler.handle(request: updated_request)
    else
      updated_request
    end
  end

  def do_handle(request:)
    raise NotImplementedError
  end
end
