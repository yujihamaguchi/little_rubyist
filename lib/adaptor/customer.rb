# frozen_string_literal: true

class Customer
  attr_accessor :supplier

  def arrival_date
    supplier.delivery_date
  end
end
