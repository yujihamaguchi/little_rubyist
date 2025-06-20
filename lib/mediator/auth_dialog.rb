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

  def notify(source:, action:)
    return unless source.instance_of?(LoginCheckbox) && action == :check

    @login_form.enable
    @register_form.disable
  end
end
