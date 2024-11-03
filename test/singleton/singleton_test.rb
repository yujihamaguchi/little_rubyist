# frozen_string_literal: true

require_relative "../test_helper"
require "singleton/my_singleton"

class SingletonTest < Minitest::Test
  def test_singleton_instance
    instance1 = MySingleton::INSTANCE
    instance2 = MySingleton::INSTANCE

    assert_same instance1, instance2
  end

  def test_singleton_instance_thread_safety
    instances = []

    threads = 10.times.map do
      Thread.new do
        instances.push MySingleton::INSTANCE
      end
    end

    threads.each(&:join)

    instances.each do |instance|
      assert_same instances.first, instance
    end
  end
end
