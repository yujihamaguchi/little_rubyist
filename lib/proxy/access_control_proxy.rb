# frozen_string_literal: true

require_relative "requestable"
class AccessControlProxy
  include Requestable

  def initialize(subject:)
    @subject = subject
  end

  def request(role:)
    raise "Access denied for #{role}" unless role == :admin

    @subject.request(role: role)
  end
end
