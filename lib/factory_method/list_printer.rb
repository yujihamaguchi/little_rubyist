# frozen_string_literal: true

class Array
  def sorted_using(comparator)
    self.sort_by!(&comparator)
  end
end

class ListPrinter
  def create_comparator
    raise NotImplementedError
  end

  def print_list(list)
    comparator = self.create_comparator
    list.sorted_using(comparator).to_s
  end
end
