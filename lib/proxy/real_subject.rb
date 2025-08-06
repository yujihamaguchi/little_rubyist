# frozen_string_literal: true

require_relative "requestable"
class RealSubject
  include Requestable
  def request(role:)
    "Request processed by #{role}"
  end
end
