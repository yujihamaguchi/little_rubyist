# frozen_string_literal: true

require_relative "component"

class LoginForm < Mediator::Component
  def initialize(dialog:)
    super
    @enabled = false
  end
end
