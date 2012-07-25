module OfficialFM
  module Projects

    # Search for a project
    def projects(search_param, options={})
      response = connection.get '/projects/search', options.merge(:q => search_param)

      response.body.projects.map! do |p|
        # remove the unnecessary root
        actual_project = p.project

        extend_response(actual_project, ProjectMethods)

        actual_project
      end

      response.body
    end

    # Retrieve information about a specific project
    def project(id, options={})
      response = connection.get("/projects/#{id}", options).body.project
      extend_response(response, ProjectMethods)
    end

    def project_playlists(id, options={})
      url = resource_url(id, 'projects', 'playlists')

      response = connection.get url, options
      response.body.playlists
    end

    def project_tracks(id, options={})
      url = resource_url(id, 'projects', 'tracks')

      response = connection.get url, options
      response.body.tracks
    end

    module ProjectMethods
      def playlists
        obj.project_playlists(self.src)
      end

      def tracks
        obj.project_tracks(self.src)
      end
    end

  end
end
