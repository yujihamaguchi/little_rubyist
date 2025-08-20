# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/bridge/remote_control"
require_relative "../../lib/bridge/high_end_audio"
require_relative "../../lib/bridge/audio_remote_control"

class RemoteControlForHighEndAudioE2eTest < Minitest::Test
  def test_toggle_power_when_disabled
    # Arrange
    radio = HighEndAudio.new
    refute radio.enabled?
    remote_control = Bridge::RemoteControl.new(device: radio)

    # Act
    remote_control.toggle_power

    # Assert
    assert radio.enabled?
  end

  def test_toggle_power_when_enabled
    # Arrange
    radio = HighEndAudio.new
    remote_control = Bridge::RemoteControl.new(device: radio)
    remote_control.toggle_power
    assert radio.enabled?

    # Act
    remote_control.toggle_power

    # Assert
    refute radio.enabled?
  end

  TEST_CASES = [{ method: :bass, expected: :BASS },
                { method: :treble, expected: :TREBLE },
                { method: :loudness, expected: :LOUDNESS }].freeze
  def test_sound_effect
    TEST_CASES.each do |test_case|
      # Arrange
      audio = HighEndAudio.new
      assert_equal :EQ, audio.sound_effect
      remote_control = AudioRemoteControl.new(device: audio)
      remote_control.toggle_power
      assert audio.enabled?

      # Act
      remote_control.send(test_case[:method])

      # Assert
      assert_equal test_case[:expected], audio.sound_effect
    end
  end

  def test_sound_effect_when_disabled
    # Arrange
    audio = HighEndAudio.new
    assert_equal :EQ, audio.sound_effect
    refute audio.enabled?
    remote_control = AudioRemoteControl.new(device: audio)

    # Act
    remote_control.bass

    # Assert
    assert_equal :EQ, audio.sound_effect
  end
end
