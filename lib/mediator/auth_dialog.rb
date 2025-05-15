# frozen_string_literal: true

require_relative "login_checkbox"
require_relative "login_form"
require_relative "register_form"
class AuthDialog
  attr_reader :login_checkbox, :login_form, :register_form

  def initialize
    @login_checkbox = LoginCheckbox.new(mediator: self)
    @login_form = LoginForm.new(mediator: self)
    @register_form = RegisterForm.new(mediator: self)
  end

  def login_checkbox_checked
    @login_form.enable
    @register_form.disable
  end

  def login_checkbox_unchecked
    @login_form.disable
    @register_form.enable
  end
end
