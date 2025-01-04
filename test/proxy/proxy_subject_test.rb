# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/proxy/proxy_subject"

class ProxySubjectTest < Minitest::Test
  def test_request_as_admin
    # Arrange
    some_subject = CustomMock.new
    some_subject.expect(:request, nil, role: :admin)
    proxy_subject = ProxySubject.new(service: some_subject)

    # Act
    proxy_subject.request(role: :admin)

    # Assert
    some_subject.verify
  end

  def test_request_as_guest
    # Arrange
    some_subject = CustomMock.new
    proxy_subject = ProxySubject.new(service: some_subject)

    # Act
    proxy_subject.request(role: :guest)

    # Assert
    some_subject.verify
  end
end
