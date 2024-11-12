# frozen_string_literal: true

require_relative "component"

class Checkbox < Mediator::Component
  attr_reader :dialog

  def initialize(dialog:)
    super
    @checked = false
  end

  def checked?
    @checked
  end

  def check
    dialog.notify(self, :check)
    @checked = true
  end
end
