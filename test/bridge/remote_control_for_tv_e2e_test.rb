# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/bridge/remote_control"
require_relative "../../lib/bridge/television"
# クライアントに提供したいインタフェースと操作対象の組み合わせ爆発を防ぎ、両者を相互に依存させずに独立拡張できるようにしたい。
class RemoteControlForTvE2eTest < Minitest::Test
  def test_toggle_power_when_disabled
    # Arrange
    tv = Television.new
    refute tv.enabled?
    remote_control = Bridge::RemoteControl.new(device: tv)

    # Act
    remote_control.toggle_power

    # Assert
    assert tv.enabled?
  end

  def test_toggle_power_when_enabled
    # Arrange
    tv = Television.new
    remote_control = Bridge::RemoteControl.new(device: tv)
    remote_control.toggle_power
    assert tv.enabled?

    # Act
    remote_control.toggle_power

    # Assert
    refute tv.enabled?
  end
end
