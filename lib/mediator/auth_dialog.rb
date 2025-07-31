# frozen_string_literal: true

require_relative "login_checkbox"
require_relative "login_form"
require_relative "register_form"

class AuthDialog
  attr_reader :login_checkbox, :login_form, :register_form

  def initialize
    @login_checkbox = LoginCheckbox.new(self, checked: false)
    @login_form = LoginForm.new(self, enabled: false)
    @register_form = RegisterForm.new(self, enabled: true)
  end

  def align(component, action)
    return unless component.is_a?(LoginCheckbox)

    if action == :check
      @login_form.enable
      @register_form.disable
    elsif action == :uncheck
      @login_form.disable
      @register_form.enable
    end
  end
end
