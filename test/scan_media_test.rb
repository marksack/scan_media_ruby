# frozen_string_literal: true

require 'test_helper'

class ScanMediaTest < Minitest::Test
  def it_has_a_version_number_2
    refute_nil ::ScanMedia::VERSION
  end
end
