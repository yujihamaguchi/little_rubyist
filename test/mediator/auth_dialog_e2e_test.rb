# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/mediator/auth_dialog"

class AuthDialogE2eTest < Minitest::Test
  def test_checkbox_check
    # Arrange
    dialog = AuthDialog.new
    refute dialog.checkbox.checked?
    refute dialog.login_form.enabled?
    assert dialog.register_form.enabled?

    # Act
    dialog.checkbox.check

    # Assert
    assert dialog.checkbox.checked?
    assert dialog.login_form.enabled?
    assert dialog.register_form.disabled?
  end

  def test_checkbox_uncheck
    # Arrange
    dialog = AuthDialog.new
    dialog.checkbox.check
    assert dialog.checkbox.checked?
    assert dialog.login_form.enabled?
    assert dialog.register_form.disabled?

    # Act
    dialog.checkbox.uncheck

    # Assert
    refute dialog.checkbox.checked?
    assert dialog.login_form.disabled?
    assert dialog.register_form.enabled?
  end
end
