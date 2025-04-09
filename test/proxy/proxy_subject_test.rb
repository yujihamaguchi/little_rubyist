# frozen_string_literal: true

require_relative "../test_helper"

class ProxySubjectTest < Minitest::Test
  def test_request_with_admin
    # Arrange
    real_subject = CustomMock.new
    role = :admin
    real_subject.expect :request, nil, role: role
    proxy_subject = ProxySubject.new(service: real_subject)

    # Act
    proxy_subject.request(role: role)

    # Assert
    real_subject.verify
  end

  def test_request_with_not_admin
    # Arrange
    real_subject = CustomMock.new
    proxy_subject = ProxySubject.new(service: real_subject)

    # Act
    proxy_subject.request(role: :not_admin)

    # Assert
    real_subject.verify
  end
end
