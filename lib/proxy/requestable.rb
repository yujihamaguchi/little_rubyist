# frozen_string_literal: true

module Requestable
  def request(role:)
    raise NotImplementedError
  end
end
