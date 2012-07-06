require 'faraday'
require 'faraday_middleware'

directory = File.expand_path(File.dirname(__FILE__))

module OfficialFM

  class << self
    attr_accessor :api_key

    # Configures default credentials easily
    # @yield api_key
    def configure
      yield self
      true
    end
  end

  require 'officialfm/tracks'
  require 'officialfm/playlists'
  require 'officialfm/projects'
  require 'officialfm/client'

end
