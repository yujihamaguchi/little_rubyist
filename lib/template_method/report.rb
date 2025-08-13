# frozen_string_literal: true

class Report
  def fetch
    %i[foo bar baz]
  end

  def format(raw_data)
    raise NotImplementedError
  end

  def generate
    self.format(self.fetch)
  end
end
