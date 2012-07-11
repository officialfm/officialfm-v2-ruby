# official.fm

Ruby wrapper for the [official.fm v2 API](http://dev.official.fm/).

## Installation

    gem install officialfm

Alternatively put this in you `Gemfile`, then run `bundle install`:

```ruby
gem 'officialfm'
```

## Get your API key

Coming soon.

You can also access the API without an API key, but with a lower rate limit.

## Usage

### Include the relevant files

```ruby
require 'rubygems'
require 'officialfm'
```

### Instantiate a client
    
```ruby
officialfm = OfficialFM::Client.new
```

With an API key:

```ruby
officialfm = OfficialFM::Client.new(:api_key => 'your_api_key')
```

You can also set a default configuration for all clients to use

```ruby
OfficialFM.configure do |c|
  c.api_key = YOUR_API_KEY
end
```

### Methods

Search for a track:

```ruby 
officialfm.tracks('Nightcall')
```

Get info about a specific track:

```ruby
officialfm.track('1nnQ')
```

Search for a playlist:

```ruby
officialfm.playlists('AWOLNATION')
```

Get info about a specific playlist:

```ruby
officialfm.playlist('CbqY')
```

This only returns general information about the playlist and the following returns only the tracks in the playlist.

```ruby
officialfm.playlist_tracks('CbqY')
```

To combine the two, use:

```ruby
officialfm.playlist('CbqY', :fields => :tracks)
```

Search for a project (a project can be an artist or a collaboration between several artists)

```ruby
officialfm.projects('Mac Miller x Pharrell')
```

Similarly to playlists, you can get general information on the project with

```ruby
officialfm.project('edB6')
```

You can retrieve only the tracks and only playlists in that project with

```ruby
officialfm.project_tracks('edB6')
officialfm.project_playlists('edB6')
```

and you can mix and match:

```ruby
# Artist information including tracks
officialfm.project('edB6', :fields => :tracks)

# Artist information and their tracks and playlists
officialfm.project('edB6', :fields => [:tracks, :playlists])
```

### Fine-grained calls

As suggested above, all methods take a second, optional, parameter: a hash of parameters to be included in the API call.

For example, to search for two Tamara Sky playlists and include their track listings in the results, you could call

```ruby
officialfm.playlists('Tamara Sky', { :limit => 2, :fields => :tracks })
```

Consult the [API docs](http://dev.official.fm) for a description of valid optional parameters.


## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but
   bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2012 Dimiter Petrov

Copyright (c) 2011 Amos Wenger

This project is distributed under the New BSD License. See LICENSE for details.

Based on [@pengwynn's Gowalla API wrapper](https://github.com/pengwynn/gowalla)
                                                                                                                                                                     
A huge load of thanks to pengwynn for releasing it open-source! It was wonderful
to work from his extra-clean codebase.


