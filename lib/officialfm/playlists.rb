module OfficialFM
  module Playlists

    # Search for a playlist
    def playlists(search_param, options={})
      response = connection.get '/playlists/search', options.merge(:q => search_param)

      response.body.playlists.map! do |p|
        # remove the unnecessary root
        actual_playlist = p.playlist

        extend_response(actual_playlist, PlaylistMethods)

        actual_playlist
      end

      response.body
    end

    # Retrieve information about a specific playlist
    def playlist(id, options={})
      response = connection.get("/playlists/#{id}", options).body.playlist
      extend_response(response, PlaylistMethods)
    end

    def playlist_tracks(id, options={})
      url = resource_url(id, 'playlists', 'tracks')

      response = connection.get url, options
      response.body.tracks
    end

    module PlaylistMethods

      def tracks
        obj.playlist_tracks(self.src)
      end
    end

  end
end
