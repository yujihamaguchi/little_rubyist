# frozen_string_literal: true

module ListPrinter
  def string_from(list)
    list.sort_by(&self.key_selector).join(", ")
  end

  def key_selector
    raise NotImplementedError
  end
end
