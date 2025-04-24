# frozen_string_literal: true

require "logger"
# noinspection RubyMismatchedArgumentType
$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require_relative "../lib/little_rubyist"

require "minitest/autorun"

require_relative "custom_mock"
