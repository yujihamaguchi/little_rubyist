# frozen_string_literal: true

class Form
  def initialize(mediator, enabled: false)
    @mediator = mediator
    @enabled = enabled
  end

  def disabled?
    !@enabled
  end

  def enabled?
    @enabled
  end

  def enable
    @enabled = true
  end

  def disable
    @enabled = false
  end
end
