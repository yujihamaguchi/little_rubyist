# frozen_string_literal: true

require_relative "report"

class HtmlReport < Report
  def format_data(data)
    "<ul>#{data.split(" ").map { |v| "<li>#{v}</li>" }.join}</ul>"
  end
end
