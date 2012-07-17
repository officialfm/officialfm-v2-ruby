module OfficialFM
  module Playlists

    # Search for a playlist
    def playlists(search_param, options={})
      response = connection.get '/playlists/search', options.merge(:q => search_param)
      response.body.playlists
    end

    # Retrieve information about a specific playlist
    def playlist(id, options={})
      response = connection.get("/playlists/#{id}", options).body.playlist
      extend_response(response, PlaylistMethods)
    end

    module PlaylistMethods
      def tracks
        response = connection.get "#{self.src}/tracks"
        response.body.tracks
      end
    end

  end
end
