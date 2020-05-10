# frozen_string_literal: true

require_relative 'metadata/extractorfactory'
require 'shellwords'

# Scans media files and extracts metadata
class Scanner
  def initialize(scan_path, output)
    @scan_path = scan_path
    @output = output
  end

  def scan
    scan_directory @scan_path if File.directory?(@scan_path)
    scan_file @scan_path if File.file?(@scan_path)
  end

  private

  def scan_file(input_file)
    escaped_file = Shellwords.escape(File.expand_path(input_file))
    file_type = `file --b --mime-type #{escaped_file}`.strip.to_sym
    extractor = ExtractorFactory.for file_type, input_file
    extractor.extract
  end

  def scan_directory(input_dir)
    Dir.chdir File.expand_path(input_dir)
    Dir.glob('**/*').each do |f|
      files_scanned += scan_file f unless File.directory?(f)
    end
  end
end
