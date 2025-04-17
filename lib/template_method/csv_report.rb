# frozen_string_literal: true

require_relative "report"

class CsvReport < Report
  def format_data(data)
    data.split(" ").join(",")
  end

  def finalize(body)
    "#{body}\n"
  end
end
