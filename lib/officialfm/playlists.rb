module OfficialFM
  module Playlists

    # Search for a playlist
    def playlists(search_param, options={})
      response = get '/playlists/search', options.merge(:q => search_param)

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
      url = resource_url(id, parent: 'playlists')

      response = get(url, options).body.playlist
      extend_response(response, PlaylistMethods)
    end

    def playlist_tracks(id, options={})
      url = resource_url(id, { parent: 'playlists', child: 'tracks' })

      response = get url, options

      tracks = response.body.tracks.map do |t|
        # remove the unnecessary root
        t.track
      end

      tracks
    end

    module PlaylistMethods

      def tracks
        obj.playlist_tracks(self.url)
      end
    end

  end
end
