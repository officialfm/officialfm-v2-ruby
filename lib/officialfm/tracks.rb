module OfficialFM
  module Tracks

    # Search for tracks
    def tracks(search_param, options={})
      response = get '/tracks/search', options.merge(:q => search_param)

      response.body.tracks.map! do |t|
        # remove useless root
        t.track
      end

      response.body
    end

    # Retrieve information about a specific track
    def track(id, options={})
      url = resource_url(id, parent: 'tracks')

      response = get url, options
      response.body.track
    end

  end
end
