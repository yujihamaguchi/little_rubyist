# frozen_string_literal: true

class ListPrinter
  def create_comparator
    raise NotImplementedError
  end

  def print_list(list)
    comparator = self.create_comparator
    list.sort_by(&comparator.comparison_proc).to_s
  end
end
