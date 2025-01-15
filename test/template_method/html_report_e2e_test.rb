# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/template_method/html_report"

class HtmlReportE2eTest < Minitest::Test
  def test_generate
    # Arrange
    report = HtmlReport.new

    # Act
    output = report.generate

    # Assert
    assert_match "[HTML Report]", output
    assert_match "<html><body>report data</bod></html>", output
  end
end
