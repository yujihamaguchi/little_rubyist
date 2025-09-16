# frozen_string_literal: true

require_relative "component"
class Form < Component
  def initialize(mediator:, enabled: false)
    super(mediator: mediator)
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
