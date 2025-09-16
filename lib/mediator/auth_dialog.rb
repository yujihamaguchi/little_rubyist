# frozen_string_literal: true

require_relative "login_checkbox"
require_relative "login_form"
require_relative "register_form"

class AuthDialog
  attr_reader :login_checkbox, :login_form, :register_form

  def initialize
    @login_checkbox = LoginCheckbox.new(mediator: self, checked: false)
    @login_form = LoginForm.new(mediator: self, enabled: false)
    @register_form = RegisterForm.new(mediator: self, enabled: true)
  end

  def notify(sender:, action:)
    case [sender, action]
    in [LoginCheckbox, :check]
      @login_form.enable
      @register_form.disable
    in [LoginCheckbox, :uncheck]
      @login_form.disable
      @register_form.enable
    else
      # no-op
    end
  end
end
