module OfficialFM
  module Projects

    # Search for a project
    def projects(search_param, options={})
      response = get '/projects/search', options.merge(:q => search_param)

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
      url = resource_url(id, parent: 'projects')

      response = get(url, options).body.project
      extend_response(response, ProjectMethods)
    end

    def project_playlists(id, options={})
      url = resource_url(id, { parent: 'projects', child: 'playlists' })

      response = get url, options

      playlists = response.body.playlists.map do |p|
        # remove the unnecessary root
        p.playlist
      end

      playlists
    end

    def project_tracks(id, options={})
      url = resource_url(id, { parent: 'projects', child: 'tracks' })

      response = get url, options

      tracks = response.body.tracks.map do |t|
        # remove the unnecessary root
        t.track
      end

      tracks
    end

    module ProjectMethods
      def playlists
        obj.project_playlists(self.url)
      end

      def tracks
        obj.project_tracks(self.url)
      end
    end

  end
end
