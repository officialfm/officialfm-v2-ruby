require 'officialfm/version'

module OfficialFM
  class Client

    include Tracks
    include Playlists
    include Projects
    
    attr_reader :api_key

    def initialize(options={})
      @api_key = options[:api_key] || OfficialFM.api_key
      connection
    end


    # Faraday::Connection used for all HTTP requests
    #
    # @return [Faraday::Connection]
    def connection
      options = {
        :url     => api_url,
        :headers => default_headers
      }
    
      @connection ||= Faraday.new(options) do |builder|
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
  end
end
