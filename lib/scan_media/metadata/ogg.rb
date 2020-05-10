# frozen_string_literal: true

# Extract metadata from ogg files
class Ogg
  def initialize(file)
    @file = file
  end

  def extract
    puts "Ogg extract #{File.expand_path @file}"
  end
end
