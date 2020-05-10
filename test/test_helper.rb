# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'scan_media'

require 'minitest/autorun'
require 'minitest/unit'
require 'minitest/spec'
require 'minitest/reporters'
require 'spy/integration'

Minitest::Reporters.use!
