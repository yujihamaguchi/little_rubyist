# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/template_method/csv_report"

class CsvReportE2eTest < Minitest::Test
  def test_generate
    # Arrange
    report = CsvReport.new

    # Act
    output = report.generate

    # Assert
    assert_match "[CSV Report]", output
    assert_match "CSV,formatted,report,data", output
  end
end
