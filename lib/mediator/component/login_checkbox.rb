# frozen_string_literal: true

require_relative "component"
class LoginCheckbox < Component
  def initialize(mediator, checked:)
    super(mediator)
    @checked = checked
  end

  def checked?
    @checked
  end

  def check
    @checked = true
    @mediator.notify(self, :check)
  end

  def uncheck
    @checked = false
    @mediator.notify(self, :uncheck)
  end
end
