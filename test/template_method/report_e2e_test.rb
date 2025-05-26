# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/template_method/report"

class ReportE2eTest < Minitest::Test
  def test_data
    # Arrange
    report = Report.new

    # Act
    output = report.fetch_data

    # Assert
    assert_equal %i[foo bar baz], output
  end
end
