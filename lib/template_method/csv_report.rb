# frozen_string_literal: true

require_relative "report"

class CsvReport < Report
  def fetch_data
    "CSV formatted report data"
  end

  def format_data(data)
    data.split(" ").join(",")
  end

  def output_report(data)
    "[CSV Report] #{data}"
  end
end
