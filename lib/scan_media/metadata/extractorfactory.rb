# frozen_string_literal: true

require_relative './donothing'
require_relative './mp3'
require_relative './ogg'
require_relative './wave'

# Build metadata extractor for specified file type
class ExtractorFactory
  TYPES = {
    'audio/mpeg': Mp3,
    'audio/x-wav': Wave,
    'audio/ogg': Ogg
  }

  def self.for(type, file)
    (TYPES[type] || DoNothing).new(file)
  end
end
