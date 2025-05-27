# frozen_string_literal: true

class Report
  def generate
    data = self.fetch
    format(data)
  end

  def fetch
    %i[foo bar baz]
  end
end
