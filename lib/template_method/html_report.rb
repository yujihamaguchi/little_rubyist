# frozen_string_literal: true

require_relative "report"
class HtmlReport < Report
  private

  def format(raw_data)
    "<ul>#{raw_data.map { |value| "<li>#{value}</li>" }.join}</ul>"
  end
end
