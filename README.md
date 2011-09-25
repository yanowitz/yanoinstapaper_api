# STATUS: THIS IS A DRAFT PROJECT.  LOOK AWAY.  EMAIL ME IF YOU WANT TO FIND OUT STATUS, BUT THIS IS A WORK IN PROGRESS.  I SHOULD BE DONE IN OCTOBER 2011

# yanoinstapaper_api - Yet ANOther Instapaper API - Ruby support for Instapaper's Simple and Full APIs

## Example usage

### simple
```ruby
 ip = YanoInstapaper::API.new
 ip.authorize( :username => 'your_username', :password => 's3cr3t!' )
``` 

### full

```ruby
 ip = YanoInstapaper::API.new( :consumer_token => '', :consumer_secret => '')
 ip.authorize


 bookmarks = ip.bookmarks.list  # default is to fetch everything
 bookmarks = ip.bookmarks.list(:limit => 50)
```

## Documentation

  This code is just a thin wrapper to the API.  For the API docs, see
  http://www.instapaper.com/api/simple or
  http://www.instapaper.com/api/full

  The code simply maps method chains onto API calls:

```ruby
  ip.bookmarks.list 
```

 turns into

```ruby
ip.access('bookmarks/list')
```

  This call either throws an exception (if the API returns a JSON
  error), JSON-marshalled hashes, or, in the instace of fetching a
  document, the document in [THIS FORMAT]

  This code does no error checking:

```ruby
  ip.foobar.baz
```
  
  will blindly try to access the Instapaper endpoint 'foobar/baz' and then blow up with a 404.  But that at least means that additions to the API shouldn't require modification of this library.  Onward to the future!


## Acknowledgements

1. I originally looked at Matt Biddulph's Instapaper Full
(https://github.com/mattb/instapaper_full).  I wanted to support both
Simple and Full API and do so via an auto-extending interface.  But I
appreciate his efforts.

2. Rick Olson's Faraday (https://github.com/technoweenie/faraday) which
takes all the pain out of doing this stuff.

3. And of course, Marco Arment's Instapaper has improved my workflow
in many ways.  It's a key part of my GTD stack (which includes, since
you didn't ask: Instapaper, Evernote, Omnifocus, and the iPhone app,
Due).

## Copyright

This software is covered by the GNU Lesser General Public License (see LICENSE.md) and copyright Jason Yanowitz &copy; 2011

