# frozen_string_literal: true

require_relative "report"
class HtmlReport < Report
  def generate
    "<ul>" +
      self.fetch_data.map do |e|
        "<li>#{e}</li>"
      end.join + "</ul>"
  end
end
