# frozen_string_literal: true

class MySingleton
  INSTANCE = new
  private_class_method :new
end
