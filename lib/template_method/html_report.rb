# frozen_string_literal: true

require_relative "report"
class HtmlReport < Report
  def format(data)
    "<ul>#{data.map { |e| "<li>#{e}</li>" }.join}</ul>"
  end
end
