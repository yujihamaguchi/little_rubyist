# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/command/text_editor"
require_relative "../../lib/command/editor_command_invoker"
require_relative "../../lib/command/editor_command"
require_relative "../../lib/command/cut_command"
require_relative "../../lib/command/copy_command"
require_relative "../../lib/command/paste_command"

# クライアントが操作対象に対するリクエストセット（実行、取り消しなど）を透過的に行えるようにすることで、クライアントロジックの複雑化・肥大化を避けたい。

# +----------------------------------+
# |          Text Editor             |
# +----------------------------------+
# | [Cut]  [Copy]  [Paste]   [Undo]  |
# +----------------------------------+

class EditorControllerE2eTest < Minitest::Test
  def setup
    @editor = TextEditor.new
    @invoker = EditorCommandInvoker.new
    @invoker.add_command(name: :cut, command: CutCommand.new(receiver: @editor))
    @invoker.add_command(name: :copy, command: CopyCommand.new(receiver: @editor))
    @invoker.add_command(name: :paste, command: PasteCommand.new(receiver: @editor))
  end

  def test_cut_command
    # Arrange
    @editor.content = "Hello World"

    # Act
    @invoker.push_button(:cut)

    # Assert
    assert_equal "", @editor.content
    assert_equal "Hello World", @editor.clipboard
  end

  def test_copy_command
    # Arrange
    @editor.content = "Hello World"

    # Act
    @invoker.push_button(:copy)

    # Assert
    assert_equal "Hello World", @editor.clipboard
    assert_equal "Hello World", @editor.content
  end

  def test_paste_command
    # Arrange
    @editor.content = "Hello"
    @editor.clipboard = " World"

    # Act
    @invoker.push_button(:paste)

    # Assert
    assert_equal "Hello World", @editor.content
    assert_equal " World", @editor.clipboard
  end

  def test_undo_cut
    # Arrange
    @editor.content = "Hello World"
    @invoker.push_button(:cut)

    # Act
    @invoker.push_undo_button

    # Assert
    assert_equal "Hello World", @editor.clipboard
    assert_equal "Hello World", @editor.content
  end

  def test_undo_paste
    # Arrange
    @editor.content = "Hello"
    @editor.clipboard = " World"
    @invoker.push_button(:paste)

    # Act
    @invoker.push_undo_button

    # Assert
    assert_equal "Hello", @editor.content
    assert_equal " World", @editor.clipboard
  end

  def test_undo_copy
    # Arrange
    @editor.content = "Hello World"
    @editor.clipboard = ""
    @invoker.push_button(:copy)

    # Act
    @invoker.push_undo_button

    # Assert
    assert_equal "Hello World", @editor.content
    assert_equal "Hello World", @editor.clipboard
  end

  def test_undo_no_last_command
    # Act: error free
    @invoker.push_undo_button
  end
end
