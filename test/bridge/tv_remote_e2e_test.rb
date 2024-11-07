# frozen_string_literal: true

# Device は以下のインタフェースを有し、
#
# 	enabled?
# 	enable
# 	disable
# 	volume
# 	volume(volume_int)
#
# Remote control は以下のインタフェースを有するものとする
# 	toggle_power
# 	volume_down
# 	volume_up
#
require_relative "../test_helper"
require "bridge/remote_control"
require "bridge/television"

class TvRemoteE2eTest < Minitest::Test
  def test_toggle_power_when_disabled
    # Arrange
    tv = Television.new
    assert_equal false, tv.enabled?
    remote = Bridge::RemoteControl.new(device: tv)

    # Act
    remote.toggle_power

    # Assert
    assert_equal true, tv.enabled?
  end

  def test_toggle_power_when_enabled
    # Arrange
    tv = Television.new
    remote = Bridge::RemoteControl.new(device: tv)
    remote.toggle_power
    assert_equal true, tv.enabled?

    # Act
    remote.toggle_power

    # Assert
    assert_equal false, tv.enabled?
  end
end
