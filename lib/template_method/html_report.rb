# frozen_string_literal: true

require_relative "report"
class HtmlReport < Report
  def format(raw_data)
    "<ul>#{raw_data.map { |elm| "<li>#{elm}</li>" }.join}</ul>"
  end
end
