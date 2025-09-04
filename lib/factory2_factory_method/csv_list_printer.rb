# frozen_string_literal: true

module CSVListPrinter
  def string_from(arr)
    arr.sort_by(&self.sort_key).join(",")
  end

  def sort_key
    raise NotImplementedError
  end
end
