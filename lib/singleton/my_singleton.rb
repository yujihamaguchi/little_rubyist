# frozen_string_literal: true

class MySingleton
  def self.instance
    @instance ||= new
  end

  private_class_method :new
end
