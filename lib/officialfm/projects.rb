module OfficialFM
  module Projects

    # Search for a project
    def projects(search_param, options={})
      response = connection.get '/projects/search', options.merge(:q => search_param)
      response.body.projects
    end

    # Retrieve information about a specific project
    def project(id, options={})
      response = connection.get("/projects/#{id}", options).body.project
      extend_response(response, ProjectMethods)
    end

    module ProjectMethods
      def playlists
        response = connection.get "#{self.src}/playlists"
        response.body.playlists
      end

      def tracks
        response = connection.get "#{self.src}/tracks"
        response.body.tracks
      end
    end
    
  end
end
