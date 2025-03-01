# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/bridge/remote_control"
require_relative "../../lib/bridge/television"

class RemoteControlForTvE2eTest < Minitest::Test
  def test_toggle_power_when_disabled
    # Arrange
    tv = Television.new
    assert_equal false, tv.enabled?
    remote_control = Bridge::RemoteControl.new(device: tv)

    # Act
    remote_control.toggle_power

    # Assert
    assert_equal true, tv.enabled?
  end

  def test_toggle_power_when_enabled
    # Arrange
    tv = Television.new
    remote_control = Bridge::RemoteControl.new(device: tv)
    remote_control.toggle_power
    assert_equal true, tv.enabled?

    # Act
    remote_control.toggle_power

    # Assert
    assert_equal false, tv.enabled?
  end
end
