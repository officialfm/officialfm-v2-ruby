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
officialfm = OfficialFM::Client.new(api_key: 'your_api_key')
```

You can also set a default configuration for all clients to use

```ruby
OfficialFM.configure do |c|
  c.api_key = YOUR_API_KEY
end
```

### Response format

All methods return either a
[Hashie:Mash](http://rdoc.info/github/intridea/hashie/Hashie/Mash) or an array
of Hashie:Mash. That means you can access the response fields via method-like
accessors. For example:

```ruby
search_results = officialfm.tracks('Wiz Khalifa')
track = search_results[3].track
puts "#{track.title} by #{track.artist}"
```

### Methods

Search for a track:

```ruby 
officialfm.tracks('Nightcall')
```

Search results being paged, you can request a specific page with the page parameter.

```ruby 
officialfm.tracks('Kids', page: 2)
```

Get info about a specific track:

```ruby
officialfm.track('1nnQ')
```

Search for a playlist (again you can pass an optional `page` parameter to get a specific results page):

```ruby
officialfm.playlists('AWOLNATION')
```

Get info about a specific playlist:

```ruby
officialfm.playlist('CbqY')
```

Retrieve the tracks in a playlist:

```ruby
playlists = officialfm.playlists('AWOLNATION')

# The tracks for the 3 playlist in the search results
tracks = playlists[2].tracks
```

Note that the `tracks` method of a playlist object makes an extra request. If
you know the playlist ID in advance, you can retrieve the tracks in just one
request.

```ruby
officialfm.playlist_tracks('CbqY')
```

Search for a project (a project can be an artist or a collaboration between several artists)

```ruby
officialfm.projects('Mac Miller x Pharrell')
```

Similarly to playlists, you can get information about a specific project with

```ruby
officialfm.project('edB6')
```

Get a project's tracks or playlists when you know the project ID in advance.

```ruby
tracks = officialfm.project_tracks('edB6')
playlists = officialfm.project_playlists('edB6')
puts artist.tracks
puts artist.playlists
```

Of course you can get the playlists and tracks in a project even if you don't know its ID:

```ruby
projects = officialfm.projects('Mac Miller')

puts projects[0].name # => 'Mac Miller'
puts projects[2].name # => 'Mac Miller x Pharrell'

tracks = projects[2].tracks

```


## Copyright

Copyright (c) 2012 official.fm

