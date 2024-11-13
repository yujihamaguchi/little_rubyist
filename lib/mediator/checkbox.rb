# frozen_string_literal: true

require_relative "component"

class Checkbox < Mediator::Component
  def initialize(dialog:)
    super
    @checked = false
  end

  def checked?
    @checked
  end

  def check
    @checked = true
    dialog.notify(component: self, event: :check)
  end

  def uncheck
    @checked = false
    dialog.notify(component: self, event: :uncheck)
  end
end
