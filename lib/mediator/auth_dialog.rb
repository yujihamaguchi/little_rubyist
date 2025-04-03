# frozen_string_literal: true
require_relative "login_checkbox"
require_relative "login_form"
require_relative "register_form"

class AuthDialog
  attr_reader :login_checkbox, :login_form, :register_form

  def initialize
    @login_checkbox = LoginCheckbox.new(parent: self)
    @login_form = LoginForm.new(parent: self, enabled: false)
    @register_form = RegisterForm.new(parent: self, enabled: true)
  end

  def notify(sender:, action:)
    case [sender, action]
    when [@login_checkbox, :check]
      @login_form.enable
      @register_form.disable
    when [@login_checkbox, :uncheck]
      @login_form.disable
      @register_form.enable
    end
  end
end
