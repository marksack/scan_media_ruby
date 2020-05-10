# frozen_string_literal: true

require 'scan_media/version'
require 'optimist'
require 'scan_media/scanner'

module ScanMedia
  # Process scan_media command line input
  class CliRunner
    def run
      opts = Optimist.options do
        opt :input, 'Input file/base of tree to scan', type: :string
        opt :output, 'Destination to save results', type: :string
      end

      input = determine_input(opts[:input])
      output = determine_output(opts[:output])
      output_message(input, output)

      scanner = Scanner.new input, output
      scanner.scan
    end

    private

    def determine_input(input)
      return File.open(Dir.pwd, 'r') unless input

      File.exist?(input) ? File.open(input, 'r') : 'File/folder does not exist'
    end

    def determine_output(output)
      return File.open('scan_media.out', 'w') unless output

      File.open(output, 'w')
    end

    def output_message(input, output)
      ending = (input.is_a? File) && File.directory?(input) ? '/' : ''
      input_str = (input.is_a? File) ? File.expand_path(input) : input
      puts "Input #{input_str}" + ending
      puts "Output #{File.expand_path(output)}"
    end
  end
end
