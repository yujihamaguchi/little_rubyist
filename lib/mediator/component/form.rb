# frozen_string_literal: true

require_relative "component"
class Form < Component
  def initialize(mediator, enabled:)
    super(mediator)
    @enabled = enabled
  end

  def enabled?
    @enabled
  end

  def disabled?
    !@enabled
  end

  def enable
    @enabled = true
  end

  def disable
    @enabled = false
  end
end
