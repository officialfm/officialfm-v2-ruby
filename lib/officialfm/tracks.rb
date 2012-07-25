module OfficialFM
  module Tracks

    # Search for tracks
    def tracks(search_param, options={})
      response = connection.get '/tracks/search', options.merge(:q => search_param)

      response.body.tracks.map! do |t|
        # remove useless root
        t.track
      end

      response.body
    end

    # Retrieve information about a specific track
    def track(id, options={})
      response = connection.get "/tracks/#{id}", options
      response.body.track
    end
    
  end
end
