# frozen_string_literal: true

class Report
  def generate
    self.format(self.fetch)
  end

  private

  def fetch
    %i[foo bar baz]
  end

  def format(raw_data)
    raise NotImplementedError
  end
end
