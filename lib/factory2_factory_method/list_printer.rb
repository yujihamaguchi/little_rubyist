# frozen_string_literal: true

module ListPrinter
  def sort_key
    raise NotImplementedError
  end

  def string_from(list)
    list.sort_by(&sort_key).to_s
  end
end
