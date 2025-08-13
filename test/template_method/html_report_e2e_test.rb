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
    assert_equal "<ul><li>foo</li><li>bar</li><li>baz</li></ul>", output
  end
end
