require 'alluc/version'
require 'excon'
require 'ostruct'
require 'json'
require 'cgi'
require 'alluc/api'
require 'alluc/requester'

module Alluc

  def self.connect(api_key, type = :alluc)
    Excon.defaults[:ssl_verify_peer] = false
    Alluc::Api.instance.tap do |api|
      api.connect(api_key, type)
    end
  end

  ['stream', 'download'].each do |action|
    define_singleton_method("#{action}_links") do |query, opts = {}|
      params = Hash.new.tap do |hash|
        hash[:count] = opts[:count] if opts[:count] # count - max-amount of returned results. Can be between 1 - 100
        hash[:from] = opts[:from] if opts[:from] # from - where to start. For example if you want result 20-30, you will set count=10 and from=20
        hash[:getmeta] = opts[:getmeta] if opts[:getmeta] # getmeta - If you want additional info on hosterlinks and source, set this to 1. Only use if you really need it as it might make for slower queries.
      end
      Alluc::Requester.get("search/#{action}?query=#{CGI.escape(query)}", params)
    end
  end

end
