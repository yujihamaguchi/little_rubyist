# frozen_string_literal: true

class LoginCheckbox
  def initialize(parent:)
    @parent = parent
    @checked = false
  end

  def checked?
    @checked
  end

  def check
    @checked = true
    @parent.notify(sender: self, action: :check)
  end

  def uncheck
    @checked = false
    @parent.notify(sender: self, action: :uncheck)
  end
end
