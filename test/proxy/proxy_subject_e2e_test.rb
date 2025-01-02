# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/proxy/real_subject"
require_relative "../../lib/proxy/proxy_subject"

class ProxySubjectE2eTest < Minitest::Test
  def test_request_as_admin
    # Arrange
    proxy_subject = ProxySubject.new(service: RealSubject.new)

    # Act
    result = proxy_subject.request(role: :admin)

    # Assert
    assert_equal "Request processed for admin", result
  end

  def test_request_as_guest
    # Arrange
    proxy_subject = ProxySubject.new(service: RealSubject.new)

    # Act
    result = proxy_subject.request(role: :guest)

    # Assert
    assert_equal "Access denied for guest", result
  end
end
