# frozen_string_literal: true

require_relative "../test_helper"
require "adaptor/customer"
require "adaptor/supplier"
require "date"

class CustomerE2eTest < Minitest::Test
  def test_arrival_date
    # Arrange
    customer = Customer.new
    supplier = Supplier.new
    supplier.delivery_date = Date.new(2024, 10, 15)
    customer.supplier = supplier

    # Act
    arrival_date = customer.arrival_date

    # Assert
    assert_equal supplier.delivery_date, arrival_date
  end
end
