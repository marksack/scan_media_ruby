# frozen_string_literal: true

# Extract metadata from MP3 files
class Mp3
  def initialize(file)
    @file = file
  end

  def extract
    puts "MP3 extract #{File.expand_path @file}"
  end
end
