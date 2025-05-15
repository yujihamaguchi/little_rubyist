# frozen_string_literal: true

require_relative "form"
class LoginForm < Form
  def initialize(mediator:)
    super(mediator: mediator)
    @enabled = false
  end
end
