# frozen_string_literal: true

require_relative "checkbox"
require_relative "login_form"
require_relative "register_form"

class AuthDialog
  attr_reader :checkbox, :login_form, :register_form

  def initialize
    @checkbox = Checkbox.new(dialog: self)
    @login_form = LoginForm.new(dialog: self)
    @register_form = RegisterForm.new(dialog: self)
  end

  def notify(component:, event:)
    return unless component.is_a?(Checkbox)

    if event == :check
      login_form.enable
      register_form.disable
    elsif event == :uncheck
      login_form.disable
      register_form.enable
    end
  end
end
