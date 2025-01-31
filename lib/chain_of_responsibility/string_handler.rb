# frozen_string_literal: true

require_relative "handler"

class StringHandler < Handler
  def do_handle(request:)
    return request unless request.key?(:text)

    updated = request.dup
    updated[:text] = updated[:text].upcase
    updated
  end
end
