# frozen_string_literal: true

require_relative "role_based_requestable"
class RealSubject
  include RoleBasedRequestable
  def request(role:)
    "Request processed by #{role}"
  end
end
