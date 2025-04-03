# frozen_string_literal: true

module Mediator
  class Form
    def initialize(parent:, enabled:)
      @parent = parent
      @enabled = enabled
    end

    def disabled?
      !self.enabled?
    end

    def enabled?
      @enabled
    end

    def disable
      @enabled = false
    end

    def enable
      @enabled = true
    end
  end
end