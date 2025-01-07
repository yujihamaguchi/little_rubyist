# frozen_string_literal: true

class HtmlReport
  def generate
    fetched_data = fetch_data
    formatted_data = format_data(fetched_data)
    output_report(formatted_data)
  end

  def fetch_data; end

  def format_data(data); end

  def output_report(data); end
end
