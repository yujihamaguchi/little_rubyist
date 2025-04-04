# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/mediator/auth_dialog"

# 各コンポーネント間で直接相互作用させると依存関係が複雑化しがちな連動ロジックを、中央の仲介者（Mediator）によって一元管理し、システム全体の秩序と拡張性を確保したい
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
