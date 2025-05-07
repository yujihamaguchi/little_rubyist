# frozen_string_literal: true

class BaseListPrinter
  def string_from(list)
    list.sort_by(&create_sort_key).to_s
  end

  private

  def create_sort_key
    raise NotImplementedError
  end
end
