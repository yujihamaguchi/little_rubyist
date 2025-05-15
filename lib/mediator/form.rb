# frozen_string_literal: true

require_relative "component"
class Form < Mediator::Component
  def disabled?
    !@enabled
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
