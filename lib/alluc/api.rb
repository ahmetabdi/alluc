require 'singleton'

module Alluc
  class Api
    include Singleton

    attr_reader :base_url, :mashape_url, :version, :api_key, :api_type

    def initialize
      self.base_url = 'https://www.alluc.com/api/'.freeze
      self.mashape_url = 'https://alluc-alluc-video-and-download-search-v1.p.mashape.com/api/'.freeze
      self.version = '0.1'.freeze
    end

    def connect(api_key, api_type)
      self.api_key = api_key
      self.api_type = api_type
    end

    def actual_url
      if api_type == :mashape
        mashape_url
      else
        base_url
      end
    end

    def url_for(action, params={})
      params[:apikey] = api_key if api_type == :alluc
      url = URI.join(actual_url, action) # Need some base_url / mashape_url logic here
      # url.query += URI.encode_www_form(params) unless params.empty?
      url.query = [url.query, params.map{|k,v| "#{k}=#{v}"}].compact.join('&')
      url.to_s
    end

    private
      attr_writer :base_url, :mashape_url, :version, :api_key, :api_type

  end
end
