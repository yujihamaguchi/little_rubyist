# frozen_string_literal: true

class TestSuite
  def initialize
    @tests = []
  end

  def add(test)
    @tests << test
  end

  def run(result)
    @tests.each do |test|
      test.run(result)
    end
  end
end

class TestResult
  def initialize
    @run_count = 0
    @error_count = 0
  end

  def test_started
    @run_count += 1
  end

  def test_failed
    @error_count += 1
  end

  def summary
    "#{@run_count} run, #{@error_count} failed"
  end
end

class TestCase
  def initialize(name)
    @name = name
  end

  def set_up; end

  def tear_down; end

  def run(result)
    result.test_started
    self.set_up
    begin
      self.send(@name)
    rescue StandardError
      result.test_failed
    end
    self.tear_down
  end
end

class WasRun < TestCase
  attr_reader :log

  def set_up
    @log = "setUp "
  end

  def test_method
    @log += "testMethod "
  end

  def test_broken_method
    raise StandardError
  end

  def tear_down
    @log += "tearDown "
  end
end

class TestCaseTest < TestCase
  def set_up
    @result = TestResult.new
  end

  def test_template_method
    @test = WasRun.new("test_method")
    @test.run(@result)
    raise unless @test.log == "setUp testMethod tearDown "
  end

  def test_result
    @test = WasRun.new("test_method")
    @test.run(@result)
    raise unless @result.summary == "1 run, 0 failed"
  end

  def test_failed_result
    @test = WasRun.new("test_broken_method")
    @test.run(@result)
    raise unless @result.summary == "1 run, 1 failed"
  end

  def test_failed_result_formatting
    @result.test_started
    @result.test_failed
    raise unless @result.summary == "1 run, 1 failed"
  end

  def test_suite
    suite = TestSuite.new
    suite.add(WasRun.new("test_method"))
    suite.add(WasRun.new("test_broken_method"))
    suite.run(@result)
    raise unless @result.summary == "2 run, 1 failed"
  end
end

suite = TestSuite.new
suite.add(TestCaseTest.new("test_template_method"))
suite.add(TestCaseTest.new("test_result"))
suite.add(TestCaseTest.new("test_failed_result"))
suite.add(TestCaseTest.new("test_failed_result_formatting"))
suite.add(TestCaseTest.new("test_suite"))
result = TestResult.new
suite.run(result)
p result.summary
