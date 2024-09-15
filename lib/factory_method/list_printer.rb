# frozen_string_literal: true

class ListPrinter
  def create_comparator
    raise NotImplementedError
  end

  def print_list(list)
    comparator = self.create_comparator
    comparison_proc = comparator.comparison_proc
    sorted_list = list.sort_by(&comparison_proc)
    sorted_list.to_s
  end
end
