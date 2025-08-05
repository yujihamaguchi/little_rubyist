# frozen_string_literal: true

module Observer
  class Subject
    def add(observer:)
      @observers << observer
    end

    def initialize
      @observers = []
    end
  end
end
