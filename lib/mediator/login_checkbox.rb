# frozen_string_literal: true

require_relative "component"
class LoginCheckbox < Component
  def initialize(mediator:, checked: false)
    super(mediator: mediator)
    @checked = checked
  end

  def checked?
    @checked
  end

  def check
    @checked = true
    @mediator.notify(sender: self, action: :check)
  end

  def uncheck
    @checked = false
    @mediator.notify(sender: self, action: :uncheck)
  end
end
