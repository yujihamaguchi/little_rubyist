# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/bridge/remote_control"
require_relative "../../lib/bridge/radio"
require_relative "../../lib/bridge/advanced_remote_control"

# 操作主体と操作対象をそれぞれ独自に拡張できるようにしたい
#  ( なぜ、 Bridge パターンという名前かというと、この構造をたとえばクラス図で表すと、
#    操作主体が操作対象を保持する関係とそれぞれが（下方に）拡張されるかたちが橋のようだから ）
# ==
# Remote control は以下のインタフェースを有し、
#
# 	toggle_power
#
# Device は以下のインタフェースを有する
#
# 	enabled?
# 	enable
# 	disable
#
# (TVRemoteControl, RadioRemoteControl... というふうに Device ごとの RemoteControl をつくってないようにするには？)

class RemoteControlForRadioE2eTest < Minitest::Test
  def test_toggle_power_when_disabled
    # Arrange
    radio = Radio.new
    assert_equal false, radio.enabled?
    remote_control = Bridge::RemoteControl.new(device: radio)

    # Act
    remote_control.toggle_power

    # Assert
    assert radio.enabled?
  end

  def test_toggle_power_when_enabled
    # Arrange
    radio = Radio.new
    remote_control = Bridge::RemoteControl.new(device: radio)
    remote_control.toggle_power
    assert_equal true, radio.enabled?

    # Act
    remote_control.toggle_power

    # Assert
    refute radio.enabled?
  end

  def test_mute
    # Arrange
    radio = Radio.new
    assert_equal radio.volume, 5
    remote_control = AdvancedRemoteControl.new(device: radio)

    # Act
    remote_control.mute

    # Assert
    assert_equal 0, radio.volume
  end
end
