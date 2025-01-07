# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/template_method/html_report"

class HtmlReportTest < Minitest::Test
  def test_generate
    # Arrange
    report = HtmlReport.new
    calls = []

    fetch_data = lambda {
      calls << { called: :fetch_data }
      "fetched_data"
    }

    format_data = lambda { |data|
      calls << { called: :format_data, args: [data] }
      "formatted_data"
    }

    output_report = lambda { |data|
      calls << { called: :output_report, args: [data] }
      "final_output"
    }

    # Act
    report.stub(:fetch_data, fetch_data) do
      report.stub(:format_data, format_data) do
        report.stub(:output_report, output_report) do
          assert_equal "final_output", report.generate
        end
      end
    end

    # Assert
    assert_equal [
      { called: :fetch_data },
      { called: :format_data, args: ["fetched_data"] },
      { called: :output_report, args: ["formatted_data"] }
    ], calls
  end
end
