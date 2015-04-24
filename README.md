# Alluc

alluc.com API

With this early version, beta-testers can access allucs database of 21 million streaming and 24m download links and execute full text search queries to find video-hoster or cyberlocker links related to any topic. Beta access is free and allows queries retrieving up to 10,000 links per day.

To sign up, choose the beta plan and complete checkout (no payment required) and you will receive your API key within the next 24 hours.
http://api.alluc.com/products/api-10000-calls-month

The API is also available on Mashape (with slightly higher latencies).
https://www.mashape.com/alluc/video-and-download-link-search/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'alluc'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install alluc

## Usage

Connect to normal alluc api
```ruby
Alluc.connect('api_key')
```
Connect to mashape api
```ruby
Alluc.connect('api_key', :mashape)
```
```ruby
Alluc.download_links('batman')
Alluc.streaming_links('batman')
```

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/alluc/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
