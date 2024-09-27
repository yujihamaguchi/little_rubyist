# frozen_string_literal: true

class Fan
  attr_accessor :status

  def on
    @status = :on
  end
end
