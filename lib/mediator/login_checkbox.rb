# frozen_string_literal: true

require_relative "colleague"
class LoginCheckbox < Colleague
  def initialize(mediator:)
    super(mediator: mediator)
    @checked = false
  end

  def checked?
    @checked
  end

  def check
    @checked = true
    @mediator.notify(source: self, action: :check)
  end
end
