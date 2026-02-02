# frozen_string_literal: true

require_relative "form"
class RegisterForm < Form
  def submit
    @mediator.notify(self, :submit)
  end
end
