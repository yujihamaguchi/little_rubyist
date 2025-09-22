# frozen_string_literal: true

require_relative "role_based_requestable"
class AccessControlProxy
  include RoleBasedRequestable

  def initialize(subject:)
    @subject = subject
  end

  def request(role:)
    raise "Access denied for #{role}" unless role == :admin

    @subject.request(role: role)
  end
end
