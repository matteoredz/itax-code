if ENV["COVERAGE"]
  require "simplecov"
  SimpleCov.start do
    add_filter "lib/itax_code/version.rb"
    add_filter "test"
  end
end

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "itax_code"

require "minitest/autorun"
require "byebug"
require "mocha/minitest"
