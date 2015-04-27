class Alluc::Requester
  class << self
    def get(action, params={})
      url = api.url_for(action, params)
      perform_request do
        parse_response(Excon.get(url, :headers => headers))
      end
    end

    private
      def api
        Alluc::Api.instance
      end

      def headers
        Hash.new.tap do |headers|
          headers['Accept'] = 'application/json'
          headers['Content-Type'] = 'application/json'
          headers['X-Mashape-Key'] = api.api_key if api.api_type == :mashape
        end
      end

      def perform_request(&block)
        begin
          block.call
        rescue Exception => e
          puts e.message
        end
      end

      def parse_response(response)
        begin
          JSON.parse(response.body)
        rescue JSON::ParserError => e
          puts e.message
        end
      end

  end
end
