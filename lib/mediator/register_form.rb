# frozen_string_literal: true

require_relative "form"
class RegisterForm < Form
  def initialize(mediator:)
    super(mediator: mediator)
    @enabled = true
  end
end
