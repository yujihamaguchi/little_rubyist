# frozen_string_literal: true

class Report
  def generate
    raw_data = fetch_data
    formatted_data = format_data(raw_data)
    finalize(formatted_data)
  end

  def fetch_data
    "foo bar baz"
  end

  protected

  def format_data(raw_data)
    raise NotImplementedError
  end

  def finalize(body)
    body
  end
end
