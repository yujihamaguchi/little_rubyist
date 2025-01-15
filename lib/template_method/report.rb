# frozen_string_literal: true

class Report
  def generate
    fetched_data = fetch_data
    formatted_data = format_data(fetched_data)
    output_report(formatted_data)
  end

  def fetch_data
    raise NotImplementedError
  end

  def format_data(data)
    raise NotImplementedError
  end

  def output_report(data)
    raise NotImplementedError
  end
end
