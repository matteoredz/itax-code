require "simplecov"
SimpleCov.start

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "itax_code"

require "byebug"
require "minitest/autorun"
require "mocha/minitest"
