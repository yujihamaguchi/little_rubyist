# frozen_string_literal: true

class TestCase
  def initialize(name)
    @name = name
  end

  def run
    self.send(@name)
  end
end

class WasRun < TestCase
  attr_reader :was_run

  def initialize(name)
    @was_run = nil
    super(name)
  end

  def test_method
    @was_run = 1
  end
end

class TestCaseTest < TestCase
  def test_running
    test = WasRun.new("test_method")
    raise if test.was_run

    test.run
    raise unless test.was_run
  end
end

TestCaseTest.new("test_running").run
