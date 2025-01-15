# frozen_string_literal: true

require_relative "report"

class HtmlReport < Report
  def fetch_data
    "report data"
  end

  def format_data(data)
    "<html><body>#{data}</bod></html>"
  end

  def output_report(data)
    "[HTML Report]#{data}"
  end
end
