# frozen_string_literal: true

require "minitest/autorun"
require_relative "../../lib/proxy/real_subject"

# リクエスト処理対象の本来の責務ではないアクセス制御や最適化などを行う必要がある。
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
