require 'test_helper'

class ChefJsonTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ChefJson::VERSION
  end
end
