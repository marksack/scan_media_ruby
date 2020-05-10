# frozen_string_literal: true

require 'test_helper'

class ScanMediaTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ScanMedia::VERSION
  end

  def test_that_it_invokes_the_scanner_with_default_parameters
    scan_spy = Spy.on_instance_method(Scanner, :scan)

    runner = ::ScanMedia::CliRunner.new
    runner.run nil, nil
    refute_nil runner

    assert scan_spy.calls.size, 1
    call = scan_spy.calls.first
    assert call.args.size, 2
    assert call.args[0].class.name, File
    assert_match 'scan_media_ruby', call.args[0].path
    assert call.args[1].class.name, File
    assert_match 'scan_media.out', call.args[1].path
  end

  def test_that_it_does_not_invoke_scanner_if_input_does_not_exist
    scan_spy = Spy.on_instance_method(Scanner, :scan)

    runner = ::ScanMedia::CliRunner.new
    runner.run './xxx', nil
    refute_nil runner

    assert scan_spy.calls.size, 0
  end
end
