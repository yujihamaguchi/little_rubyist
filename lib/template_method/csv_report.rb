# frozen_string_literal: true

require_relative "report"
class CsvReport < Report
  def generate
    self.fetch_data.join(",")
  end
end
