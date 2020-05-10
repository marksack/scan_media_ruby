# frozen_string_literal: true

# Extract metadata from wav files
class Wave
  def initialize(file)
    @file = file
  end

  def extract
    puts "Wave extract #{File.expand_path @file}"
  end
end
