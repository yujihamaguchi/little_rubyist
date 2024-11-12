# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/mediator/auth_dialog"

class AuthDialogE2eTest < Minitest::Test
  def test_checkbox_check
    # Arrange
    dialog = AuthDialog.new
    refute dialog.checkbox.checked?
    refute dialog.login_form.enabled?
    refute dialog.register_form.disabled?

    # Act
    dialog.checkbox.check

    # Assert
    assert dialog.checkbox.checked?
    assert dialog.login_form.enabled?
    assert dialog.register_form.disabled?
  end
end
