# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/proxy/real_subject"
require_relative "../../lib/proxy/proxy_subject"

# リアルな処理（RealSubject）を直接呼び出すのではなく、代理人（Proxy）を挟んで前処理／制御を行い、クライアントを煩わせずに最適化・保護・遅延生成などをしたい
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
