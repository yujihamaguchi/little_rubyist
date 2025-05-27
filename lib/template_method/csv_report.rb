# frozen_string_literal: true

require_relative "report"
class CsvReport < Report
  def generate
    self.fetch.join(",")
  end
end
