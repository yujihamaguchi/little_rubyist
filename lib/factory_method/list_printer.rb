# frozen_string_literal: true

class ListPrinter
  def create_comparator
    raise NotImplementedError
  end

  def print_list(list)
    comparator = self.create_comparator
    comparison_lambda = comparator.comparison_lambda
    sorted_list = list.sort_by(&comparison_lambda)
    sorted_list.to_s
  end
end
