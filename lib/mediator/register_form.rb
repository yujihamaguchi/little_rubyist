# frozen_string_literal: true

require_relative "component"

class RegisterForm < Mediator::Component
  def initialize(dialog:)
    super
    @enabled = true
  end
end
