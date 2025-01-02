# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/proxy/real_subject"

class RealSubjectE2eTest < Minitest::Test
  def test_request
    # Arrange
    real_subject = RealSubject.new

    # Act
    result = real_subject.request(role: :any)

    # Assert
    assert_equal "Request processed for any", result
  end
end
