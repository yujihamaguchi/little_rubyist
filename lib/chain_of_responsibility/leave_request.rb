# frozen_string_literal: true

class LeaveRequest
  attr_reader :days

  def initialize(days:)
    @days = days
  end
end
