# frozen_string_literal: true

module Bridge
  class RemoteControl
    attr_reader :device

    def initialize(device:)
      @device = device
    end

    def toggle_power
      return @device.disable if @device.enabled?

      @device.enable
    end
  end
end
