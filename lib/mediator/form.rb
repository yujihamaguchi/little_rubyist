# frozen_string_literal: true

require_relative "colleague"
class Form < Colleague
  def initialize(mediator:, enable: false)
    super(mediator: mediator)
    @enable = enable
  end

  def enabled?
    @enable
  end

  def disabled?
    !@enable
  end

  def enable
    @enable = true
  end

  def disable
    @enable = false
  end
end
