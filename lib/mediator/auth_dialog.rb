# frozen_string_literal: true

require_relative "component/login_checkbox"
require_relative "component/login_form"
require_relative "component/register_form"

class AuthDialog
  attr_reader :login_checkbox, :login_form, :register_form

  def initialize
    @login_checkbox = LoginCheckbox.new(self, checked: false)
    @login_form = LoginForm.new(self, enabled: false)
    @register_form = RegisterForm.new(self, enabled: true)
  end

  def notify(target, action)
    if target == @login_checkbox

      case action
      when :check
        @login_form.enable
        @register_form.disable
      when :uncheck
        @login_form.disable
        @register_form.enable
      else
        # no op
      end
    elsif target == @register_form
      case action
      when :submit
        @login_checkbox.check
      else
        # no op
      end
    end
  end
end
