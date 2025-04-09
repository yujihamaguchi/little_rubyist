# frozen_string_literal: true

require "minitest/autorun"

class RealSubjectE2eTest < Minitest::Test
  TEST_CASES = [
    { role: :foo, expected: "Request processed by foo" },
    { role: :bar, expected: "Request processed by bar" },
    { role: :baz, expected: "Request processed by baz" }
  ].freeze

  def test_request
    TEST_CASES.each do |test_case|
      # Arrange
      real_subject = RealSubject.new

      # Act
      result = real_subject.request(role: test_case[:role])

      # Assert
      assert_equal test_case[:expected], result
    end
  end
end
