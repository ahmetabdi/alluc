require 'alluc/version'
require 'excon'
require 'pry'
require 'ostruct'
require 'json'
require 'cgi'
require 'alluc/api'
require 'alluc/requester'

module Alluc

  def self.connect(api_key)
    Alluc::Api.instance.tap do |api|
      api.connect(api_key)
    end
  end

  def self.streaming_links(query, opts={})
    params = Hash.new.tap do |hash|
      hash['query'] = CGI.escape(query)
      hash['count'] = opts[:count] if opts[:count] # count - max-amount of returned results. Can be between 1 - 100
      hash['from'] = opts[:from] if opts[:from] # from - where to start. For example if you want result 20-30, you will set count=10 and from=20
      hash['getmeta'] = opts[:getmeta] if opts[:getmeta] # getmeta - If you want additional info on hosterlinks and source, set this to 1. Only use if you really need it as it might make for slower queries.
    end
    Alluc::Requester.get('search/stream', params)
  end

  def self.download_links(query, opts={})
    params = Hash.new.tap do |hash|
      hash['query'] = CGI.escape(query)
      hash['count'] = opts[:count] if opts[:count] # count - max-amount of returned results. Can be between 1 - 100
      hash['from'] = opts[:from] if opts[:from] # from - where to start. For example if you want result 20-30, you will set count=10 and from=20
      hash['getmeta'] = opts[:getmeta] if opts[:getmeta] # getmeta - If you want additional info on hosterlinks and source, set this to 1. Only use if you really need it as it might make for slower queries.
    end
    Alluc::Requester.get('search/download', params)
  end

end
