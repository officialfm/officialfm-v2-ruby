module OfficialFM
  module Projects

    # Search for a project
    def projects(search_param, options={})
      response = connection.get '/projects/search', options.merge(:q => search_param)
      response.body.projects
    end

    # Retrieve information about a specific project
    def project(id, options={})
      response = connection.get "/projects/#{id}", options
      response.body.project
    end

    # Retrieve a project's tracks
    def project_tracks(id, options={})
      response = connection.get "/projects/#{id}/tracks", options
      response.body.tracks
    end
    
    # Retrieve a projects's playlists
    def project_playlists(id, options={})
      response = connection.get "/projects/#{id}/playlists", options
      response.body.playlists
    end
    
  end
end
