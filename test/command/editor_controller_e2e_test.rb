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
  def test_cut_command
    # Arrange
    editor = TextEditor.new
    editor.content = "Hello World"
    controller = EditorController.new
    controller.add_command(slot_number: 1, command: CutCommand.new(receiver: editor))

    # Act
    controller.push_button(slot_number: 1)

    # Assert
    assert_equal "", editor.content
    assert_equal "Hello World", editor.clipboard
  end

  def test_copy_command
    # Arrange
    editor = TextEditor.new
    editor.content = "Hello World"
    controller = EditorController.new
    controller.add_command(slot_number: 2, command: CopyCommand.new(receiver: editor))

    # Act
    controller.push_button(slot_number: 2)

    # Assert
    assert_equal "Hello World", editor.content
    assert_equal "Hello World", editor.clipboard
  end

  def test_paste_command
    # Arrange
    editor = TextEditor.new
    editor.content = "Hello"
    editor.clipboard = " World"
    controller = EditorController.new
    controller.add_command(slot_number: 3, command: PasteCommand.new(receiver: editor))

    # Act
    controller.push_button(slot_number: 3)

    # Assert
    assert_equal "Hello World", editor.content
  end

  # def test_undo_cut
  #   # Arrange
  #   editor = TextEditor.new
  #   editor.content = "Hello World"
  #   controller = EditorController.new
  #   cut_command = CutCommand.new(receiver: editor)
  #   controller.add_command(slot_number: 1, command: cut_command)
  #
  #   # Act: Execute cut then undo it
  #   controller.push_button(slot_number: 1)
  #   assert_equal "", editor.content
  #   controller.push_undo_button
  #
  #   # Assert
  #   assert_equal "Hello World", editor.content
  # end
  #
  # def test_undo_paste
  #   # Arrange
  #   editor = TextEditor.new
  #   editor.content = "Hello"
  #   editor.clipboard = " World"
  #   controller = EditorController.new
  #   paste_command = PasteCommand.new(receiver: editor)
  #   controller.add_command(slot_number: 3, command: paste_command)
  #
  #   # Act: Execute paste then undo it
  #   controller.push_button(slot_number: 3)
  #   assert_equal "Hello World", editor.content
  #   controller.push_undo_button
  #
  #   # Assert
  #   assert_equal "Hello", editor.content
  # end
  #
  # def test_cut_copy_paste_and_undo
  #   # Arrange
  #   editor = TextEditor.new
  #   editor.content = "Hello World"
  #   controller = EditorController.new
  #   controller.add_command(slot_number: 1, command: CutCommand.new(receiver: editor))
  #   controller.add_command(slot_number: 2, command: CopyCommand.new(receiver: editor))
  #   controller.add_command(slot_number: 3, command: PasteCommand.new(receiver: editor))
  #
  #   # Act: Cut
  #   controller.push_button(slot_number: 1)
  #
  #   # Assert
  #   assert_equal "", editor.content
  #   assert_equal "Hello World", editor.clipboard
  #
  #   editor.content = "Hello World"
  #
  #   # Act: Copy
  #   controller.push_button(slot_number: 2)
  #
  #   # Assert
  #   assert_equal "Hello World", editor.clipboard
  #
  #   # Act: Paste
  #   controller.push_button(slot_number: 3)
  #
  #   # Assert
  #   assert_equal "Hello WorldHello World", editor.content
  #
  #   # Act: Undo
  #   controller.push_undo_button
  #
  #   # Assert
  #   assert_equal "Hello World", editor.content
  #
  #   editor.content = "Hello World"
  #
  #   # Act: Cut
  #   controller.push_button(slot_number: 1)
  #
  #   # Assert
  #   assert_equal "", editor.content
  #
  #   # Act: Undo
  #   controller.push_undo_button
  #   assert_equal "Hello World", editor.content
  # end
  #
  # def test_no_command_assigned
  #   # Arrange
  #   editor = TextEditor.new
  #   controller = EditorController.new
  #
  #   # Act
  #   controller.push_button(slot_number: 1)
  #
  #   # Assert
  #   assert_equal "No command assigned to slot 1", controller.display_message
  # end
end
