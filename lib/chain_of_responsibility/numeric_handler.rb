# frozen_string_literal: true

require_relative "handler"

class NumericHandler < Handler
  def do_handle(request:)
    return request unless request.key?(:number)

    updated = request.dup
    updated[:number] = updated[:number] + 1
    updated
  end
end
