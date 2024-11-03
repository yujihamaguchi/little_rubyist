# frozen_string_literal: true

require_relative "../test_helper"
require "singleton/my_singleton"

class SingletonTest < Minitest::Test
  def test_singleton_instance
    instance1 = MySingleton::INSTANCE
    instance2 = MySingleton::INSTANCE

    assert_same instance1, instance2
  end

  # TODO: スレッドセーフでなければ落ちるテストを書く
end
