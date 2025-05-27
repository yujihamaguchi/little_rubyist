# frozen_string_literal: true

class Report
  def generate
    raw_data = self.fetch
    format(raw_data)
  end

  protected

  def fetch
    %i[foo bar baz]
  end

  def format(data)
    raise NotImplementedError
  end
end
