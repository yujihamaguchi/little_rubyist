# frozen_string_literal: true

require_relative "../test_helper"
require "adaptor/customer"

class CustomerTest < Minitest::Test
  def test_arrival_date
    # Arrange
    customer = Customer.new
    supplier = CustomMock.new
    delivery_date = CustomMock.new
    supplier.expect :delivery_date, delivery_date

    # Act
    arrival_date = nil
    customer.stub :supplier, supplier do
      arrival_date = customer.arrival_date
    end

    # Assert
    supplier.verify
    assert_equal delivery_date, arrival_date
  end
end
