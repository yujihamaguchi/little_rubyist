# frozen_string_literal: true

require_relative "observer"
class StatisticAnalyzer < Observer
  def analyze
    "Statistic / temperature: #{@temperature} is cold!"
  end
end
