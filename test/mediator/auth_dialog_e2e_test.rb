# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/mediator/auth_dialog"

# 多対多のオブジェクト間の直接的な依存関係を排除し、振る舞いの連携を中央の仲介者に集約することで、構造の単純化と柔軟な変更を可能にしたい
class AuthDialogE2eTest < Minitest::Test
  def test_checkbox_check
    # Arrange
    dialog = AuthDialog.new
    refute dialog.login_checkbox.checked?
    assert dialog.login_form.disabled?
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
