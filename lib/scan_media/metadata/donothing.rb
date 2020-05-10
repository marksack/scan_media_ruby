# frozen_string_literal: true

# Metadata extractor for unrecognized file types
class DoNothing
  def initialize(file)
    @file = file
  end

  def extract
    puts "Do nothing for file #{File.expand_path(@file)}"
  end
end
