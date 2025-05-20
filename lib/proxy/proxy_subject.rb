# frozen_string_literal: true

require_relative "subject"
class ProxySubject
  include Subject
  def initialize(service:)
    @service = service
  end

  def request(role:)
    return "Access denied for #{role}" if role != :admin

    @service.request(role: role)
  end
end
