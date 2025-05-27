# frozen_string_literal: true

require_relative "report"
class CsvReport < Report
  def format(data)
    data.join(",")
  end
end
