# frozen_string_literal: true

module Mediator
  class Component
    def disable
      @enabled = false
    end

    def enable
      @enabled = true
    end

    def disabled?
      !@enabled
    end

    def enabled?
      @enabled
    end

    def initialize(dialog:)
      @dialog = dialog
    end
  end
end
