require "test_helper"

class ItaxCodeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ItaxCode::VERSION
  end
end
