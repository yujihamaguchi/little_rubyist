# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/command/command"
require_relative "../../lib/command/copy_command"
require_relative "../../lib/command/cut_command"
require_relative "../../lib/command/paste_command"
require_relative "../../lib/command/editor_controller"
require_relative "../../lib/command/text_editor"

# クライアントが操作対象に対するリクエストセット（実行、取り消しなど）を透過的に行いたい

# +----------------------------------+
# |          Text Editor             |
# +----------------------------------+
# | [Cut]  [Copy]  [Paste]   [Undo]  |
# +----------------------------------+

class EditorControllerE2eTest < Minitest::Test
  def setup
    @controller = EditorController.new
    @editor = TextEditor.new
    @controller.add_command(slot_number: 1, command: CutCommand.new(receiver: @editor))
    @controller.add_command(slot_number: 2, command: CopyCommand.new(receiver: @editor))
    @controller.add_command(slot_number: 3, command: PasteCommand.new(receiver: @editor))
  end

  def test_cut_command
    # Arrange
    @editor.content = "Hello World"

    # Act
    @controller.push_button(slot_number: 1)

    # Assert
    assert_equal "", @editor.content
    assert_equal "Hello World", @editor.clipboard
  end

  def test_copy_command
    # Arrange
    @editor.content = "Hello World"

    # Act
    @controller.push_button(slot_number: 2)

    # Assert
    assert_equal "Hello World", @editor.content
    assert_equal "Hello World", @editor.clipboard
  end

  def test_paste_command
    # Arrange
    @editor.content = "Hello"
    @editor.clipboard = " World"

    # Act
    @controller.push_button(slot_number: 3)

    # Assert
    assert_equal "Hello World", @editor.content
  end

  def test_undo_cut
    # Arrange
    @editor.content = "Hello World"

    # Act
    @controller.push_button(slot_number: 1)
    assert_equal "", @editor.content
    @controller.push_undo_button

    # Assert
    assert_equal "Hello World", @editor.clipboard
    assert_equal "Hello World", @editor.content
  end

  def test_undo_paste
    # Arrange
    @editor.content = "Hello"
    @editor.clipboard = " World"

    # Act
    @controller.push_button(slot_number: 3)
    assert_equal "Hello World", @editor.content
    @controller.push_undo_button

    # Assert
    assert_equal "Hello", @editor.content
  end

  def test_undo_no_last_command
    # Act: error free
    @controller.push_undo_button
  end
end
