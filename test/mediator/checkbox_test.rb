# frozen_string_literal: true

require_relative "../test_helper"

require_relative "../../lib/mediator/checkbox"

class CheckboxTest < Minitest::Test
  def setup
    @dialog = CustomMock.new
    @checkbox = Checkbox.new(dialog: @dialog)
  end

  def test_check
    # Arrange
    @dialog.expect :notify, nil, [], component: @checkbox, event: :check

    # Act
    @checkbox.check

    # Assert
    assert @checkbox.checked?
    @dialog.verify
  end

  def test_uncheck
    # Arrange
    @dialog.expect :notify, nil, [], component: @checkbox, event: :uncheck

    # Act
    @checkbox.uncheck

    # Assert
    refute @checkbox.checked?
    @dialog.verify
  end
end
