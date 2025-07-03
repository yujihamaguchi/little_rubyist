# frozen_string_literal: true

require_relative "report"
class CsvReport < Report
  def format(raw_data)
    raw_data.join(",")
  end
end
