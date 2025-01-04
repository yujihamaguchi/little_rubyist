# frozen_string_literal: true

require_relative "subject"

class ProxySubject
  include Subject

  def initialize(service:)
    @service = service
  end

  def request(role:)
    return @service.request(role: role) if role == :admin

    "Access denied for #{role}"
  end
end
