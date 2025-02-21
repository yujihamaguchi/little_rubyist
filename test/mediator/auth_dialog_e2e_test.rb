# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/mediator/auth_dialog"

# 関連するコンポーネント同士の連動を各コンポーネントに任せて混沌としないように一元管理したい
class AuthDialogE2eTest < Minitest::Test
  def test_checkbox_check
    # Arrange
    dialog = AuthDialog.new
    refute dialog.login_checkbox.checked?
    refute dialog.login_form.enabled?
    assert dialog.register_form.enabled?

    # Act
    dialog.login_checkbox.check

    # Assert
    assert dialog.login_checkbox.checked?
    assert dialog.login_form.enabled?
    assert dialog.register_form.disabled?
  end

  def test_checkbox_uncheck
    # Arrange
    dialog = AuthDialog.new
    dialog.login_checkbox.check
    assert dialog.login_checkbox.checked?
    assert dialog.login_form.enabled?
    assert dialog.register_form.disabled?

    # Act
    dialog.login_checkbox.uncheck

    # Assert
    refute dialog.login_checkbox.checked?
    assert dialog.login_form.disabled?
    assert dialog.register_form.enabled?
  end
end
