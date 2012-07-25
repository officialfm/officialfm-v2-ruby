require 'officialfm/version'

module OfficialFM
  class Client

    include Tracks
    include Playlists
    include Projects
    
    attr_reader :api_key

    def initialize(options={})
      @api_key = options[:api_key] || OfficialFM.api_key
      connection(options)
    end


    # Faraday::Connection used for all HTTP requests
    #
    # @return [Faraday::Connection]
    def connection(options={})
      config = {
        :url     => api_url,
        :headers => default_headers
      }.merge(options)
    
      @connection ||= Faraday.new(config) do |builder|
        builder.adapter Faraday.default_adapter

        builder.request :url_encoded

        builder.response :mashify
        builder.response :json
      end

    end
    
    # @private
    def default_headers
      headers = {
        'X-API-Version' => '2.0',
        :accept         => 'application/json',
        :user_agent     => "officialfm v2 ruby gem version #{OfficialFM::VERSION}"
      }
      headers['X-API-KEY'] = @api_key if @api_key

      headers
    end

    # Provides the URL for accessing the API
    #
    # @return [String]
    def api_url
      "http://api.official.fm"
    end

    private

    # Returns the url for a ressource no matter if the full resource url is
    # given or only the resource id.
    #
    # Both calls below should return 'http://api.official.fm/playlists/2BHH/tracks'
    #
    # resource_url('http://api.official.fm/playlists/2BHH', 'playlists', 'tracks')
    # resource_url('2BHH', 'playlists', 'tracks')
    #
    def resource_url(id, parent, child)
      if id.start_with? 'http'
        return "#{id}/#{child}"
      end

      "/#{parent}/#{id}/#{child}"
    end

    def extend_response(response, mixin_module)
      response.obj = self
      response.extend(mixin_module)
    end

  end
end
