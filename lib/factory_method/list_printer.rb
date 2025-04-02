# frozen_string_literal: true

class ListPrinter
  def create_key_extractor
    raise NotImplementedError
  end
  def string_from(list)
    list.sort_by(&create_key_extractor).to_s
  end
end
