# frozen_string_literal: true

require_relative "component"
class LoginCheckbox < Mediator::Component
  def initialize(mediator:)
    super(mediator: mediator)
    @checked = false
  end

  def checked?
    @checked
  end

  def check
    @checked = true
    @mediator.login_checkbox_checked
  end

  def uncheck
    @checked = false
    @mediator.login_checkbox_unchecked
  end
end
