# frozen_string_literal: true

require_relative "subject"

class RealSubject
  include Subject

  def request(role:)
    "Request processed for #{role}"
  end
end
