# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/proxy/real_subject"
require_relative "../../lib/proxy/proxy_subject"

# 実際に処理を行う対象（ RealSubject ）に直接実行を依頼せず、代理（ Proxy ）を挟んで前処理 / 制御等を行い、クライアントを煩わせずに最適化 / 保護 / 遅延生成などを行いたい
class ProxySubjectE2eTest < Minitest::Test
  def test_request_as_admin
    # Arrange
    proxy_subject = ProxySubject.new(service: RealSubject.new)

    # Act
    result = proxy_subject.request(role: :admin)

    # Assert
    assert_equal "Request processed by admin", result
  end

  def test_request_as_guest
    # Arrange
    proxy_subject = ProxySubject.new(service: RealSubject.new)

    # Act
    result = proxy_subject.request(role: :guest)

    # Assert
    assert_equal "Access denied for guest", result
  end

  def test_request_as_user
    # Arrange
    proxy_subject = ProxySubject.new(service: RealSubject.new)

    # Act
    result = proxy_subject.request(role: :user)

    # Assert
    assert_equal "Access denied for user", result
  end
end
