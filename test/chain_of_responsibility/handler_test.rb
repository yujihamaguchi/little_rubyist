# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/chain_of_responsibility/handler"
require_relative "../../lib/chain_of_responsibility/leave_request"

class HandlerTest < Minitest::Test
  def test_handle_with_handleable_request
    # Arrange
    handler = Handler.new
    days = CustomMock.new
    leave_request = LeaveRequest.new(days: days)
    expected = "this handler processed the request"

    # Act
    result = handler.stub :process, expected, leave_request: leave_request do
      handler.stub :handleable?, true, leave_request: leave_request do
        handler.handle(leave_request: leave_request)
      end
    end

    # Assert
    assert_equal expected, result
  end

  def test_handle_with_unhandleable_request
    # Arrange
    handler = Handler.new
    next_handler = CustomMock.new
    days = CustomMock.new
    leave_request = LeaveRequest.new(days: days)
    next_handler.expect :handle, nil, leave_request: leave_request
    handler.next_handler = next_handler

    # Act
    handler.stub :handleable?, false, leave_request: leave_request do
      handler.handle(leave_request: leave_request)
    end

    # Assert
    next_handler.verify
  end
end
