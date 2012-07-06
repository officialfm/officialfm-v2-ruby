module OfficialFM
  module Playlists

    # Search for a playlist
    def playlists(search_param, options={})
      response = connection.get '/playlists/search', options.merge(:q => search_param)
      response.body.playlists
    end

    # Retrieve information about a specific playlist
    def playlist(id, options={})
      response = connection.get "/playlists/#{id}", options
      response.body.playlist
    end

    # Retrieve the tracks in a playlist
    def playlist_tracks(id, options={})
      response = connection.get "/playlists/#{id}/tracks", options
      response.body.tracks
    end
    
  end
end
