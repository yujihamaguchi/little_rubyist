# frozen_string_literal: true

require_relative "form"
class RegisterForm < Form
  def initialize(mediator:, enable:)
    super(mediator: mediator)
    @enable = enable
  end
end
