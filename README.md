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

The objects returned by the `#playlist` and `#project` methods come with a
method along with the usual properties, allowing you to chain API calls.

```ruby
# chain retrieving information about a playlist and retrieving the playlist's tracks
officialfm.playlist('CbqY').tracks

artist = officialfm.project('edB6')
puts artist.tracks
puts artist.playlists
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

Retrieve the tracks in a playlist

```ruby
officialfm.playlist('CbqY').tracks
```

Note that the above makes two requests, therefore you may want to cache the response.

Search for a project (a project can be an artist or a collaboration between several artists)

```ruby
officialfm.projects('Mac Miller x Pharrell')
```

Similarly to playlists, you can get information about a specific project with

```ruby
officialfm.project('edB6')
```

Get a project's tracks or playlists:

```ruby
artist = officialfm.project('edB6')
puts artist.tracks
puts artist.playlists
```

Again, the `tracks` and `playlists` methods make an extra request each. Make
sure to cache the results if you use them more than once.


## Copyright

Copyright (c) 2012 official.fm

