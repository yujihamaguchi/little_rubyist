# frozen_string_literal: true

class LoginCheckbox
  def initialize(mediator, checked: false)
    @mediator = mediator
    @checked = checked
  end

  def check
    @checked = true
    @mediator.align(self, :check)
  end

  def uncheck
    @checked = false
    @mediator.align(self, :uncheck)
  end

  def checked?
    @checked
  end
end
