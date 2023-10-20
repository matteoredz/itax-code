# frozen_string_literal: true

require "simplecov"
SimpleCov.start do
  add_filter "test"
  enable_coverage :branch
  minimum_coverage line: 100, branch: 100
end

require "byebug"
require "minitest/autorun"
require "mocha/minitest"
require "timecop"

require_relative "support/test_macro"

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "itax_code"

Minitest::Test.class_eval do
  extend TestMacro
end
