# frozen_string_literal: true

class ListPrinter
  def string_from(list)
    list.sort_by(&rule).to_s
  end

  def rule
    raise NotImplementedError
  end
end
