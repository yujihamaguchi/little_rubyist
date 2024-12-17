# frozen_string_literal: true

module Mediator
  class Component
    attr_reader :dialog

    def initialize(dialog:)
      @dialog = dialog
    end

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
  end
end
