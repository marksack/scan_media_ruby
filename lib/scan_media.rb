# frozen_string_literal: true

require 'scan_media/version'
require 'scan_media/scanner'

module ScanMedia
  # Process scan_media command line input
  class CliRunner
    def run(input, output)
      input_file = resolve_input input
      output_file = resolve_output output
      output_message(input, input_file, output_file)

      if input_file.class == File && output_file.class == File
        scanner = Scanner.allocate
        scanner.scan input_file, output_file
      end
    end

    private

    def resolve_input(input)
      return File.open(Dir.pwd, 'r') unless input

      File.exist?(input) ? File.open(input, 'r') : 'File/folder does not exist'
    end

    def resolve_output(output)
      return File.open('scan_media.out', 'w') unless output

      File.open(output, 'w')
    end

    def output_message(input, in_file, out_file)
      input_str = input + ' ' + in_file if in_file.is_a?(String)
      ending = (in_file.is_a? File) && File.directory?(in_file) ? '/' : ''
      input_str = File.expand_path(in_file) if in_file.is_a?(File)
      puts "Input #{input_str}" + ending
      puts "Output #{File.expand_path(out_file)}"
    end
  end
end
