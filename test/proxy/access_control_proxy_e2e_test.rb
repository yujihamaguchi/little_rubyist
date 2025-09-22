# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/proxy/real_subject"
require_relative "../../lib/proxy/access_control_proxy"

class AccessControlProxyE2eTest < Minitest::Test
  def test_request_as_adminrake(_test)
    # Arrange
    proxy_subject = AccessControlProxy.new(subject: RealSubject.new)

    # Act
    result = proxy_subject.request(role: :admin)

    # Assert
    assert_equal "Request processed by admin", result
  end

  def test_request_as_guest
    # Arrange
    proxy_subject = AccessControlProxy.new(subject: RealSubject.new)

    # Act
    error = assert_raises(RuntimeError) do
      proxy_subject.request(role: :guest)
    end

    # Assert
    assert_equal "Access denied for guest", error.message
  end

  def test_request_as_user
    # Arrange
    proxy_subject = AccessControlProxy.new(subject: RealSubject.new)

    # Act
    error = assert_raises(RuntimeError) do
      proxy_subject.request(role: :user)
    end

    # Assert
    assert_equal "Access denied for user", error.message
  end
end
