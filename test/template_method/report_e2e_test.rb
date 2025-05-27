# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/template_method/report"

class ReportE2eTest < Minitest::Test
  def test_fetch_data
    # Arrange
    report = Report.new

    # Act
    output = report.fetch

    # Assert
    assert_equal %i[foo bar baz], output
  end

  def test_generate
    # Arrange
    report = Report.new

    fetched = CustomMock.new
    formatted = CustomMock.new

    report.instance_variable_set(:@fetched, fetched)
    def report.fetch
      @fetched
    end

    report.instance_variable_set(:@formatted, formatted)
    def report.format(data)
      @recorded_argument = data
      @formatted
    end

    # Act
    result = report.generate

    # Assert
    assert_equal fetched, report.instance_variable_get(:@recorded_argument)
    assert_equal formatted, result
  end
end
