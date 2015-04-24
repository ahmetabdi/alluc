require 'singleton'

module Alluc
  class Api
    include Singleton

    attr_reader :base_url, :mashape_url, :version, :api_key

    def initialize
      self.base_url = 'https://www.alluc.com/api/'.freeze
      self.mashape_url = 'https://alluc-alluc-video-and-download-search-v1.p.mashape.com/api/'.freeze
      self.version = '0.1'.freeze
    end

    def connect(api_key)
      self.api_key = api_key
    end

    def url_for(action, params={})
      url = URI.join(mashape_url, action) # Need some base_url / mashape_url logic here
      url.query = URI.encode_www_form(params) unless params.empty?
      url.to_s
    end

    private
      attr_writer :base_url, :mashape_url, :version, :api_key

  end
end
