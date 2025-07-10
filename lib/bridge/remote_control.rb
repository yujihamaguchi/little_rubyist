# frozen_string_literal: true

module Bridge
  class RemoteControl
    def initialize(device:)
      @device = device
    end

    def toggle_power
      return @device.enable unless @device.enabled?

      @device.disable
    end
  end
end
