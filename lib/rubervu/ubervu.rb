# Copyright (c) 2009 Radu Spineanu
# You can redistribute it and/or modify it under the same terms as Ruby.
#

module Rubervu

  # Main Ubervu Class
  # You use it by doing the following:
  #          ubervu = Rubervu::Ubervu.new('API_KEY')
  #
  # Next you can call the Ubervu subclasses like:
  #          result = ubervu.resources.show(url)
  #
  class Ubervu
    # Initializes the Ubervu Class.
    def initialize(api_key, api_url = 'http://api.contextvoice.com')
      @api_key    = api_key
      @api_url    = api_url
    end

    # Maps UbervuResource. See UbervuResource for more information about methods.
    def resources
      UbervuResource.new(@api_key, @api_url)
    end

    # Maps UbervuReaction. See UbervuReaction for more information about methods
    def reactions
      UbervuReaction.new(@api_key, @api_url)
    end

    # Processes the request. Creates the API call and returns a JSON parsed result.
    def request(resource, function, params, method = 'get', post_data = nil, api_key = @api_key, api_url = @api_url)
      rq = "#{api_url}/#{API_VER}/#{resource}/#{function}?apikey=#{CGI.escape api_key}&format=#{CGI.escape FORMAT}"

      if params and params.size > 0 
        params.each_pair do |key, value|
          rq += "&#{key}=#{CGI.escape value}"
        end
      end
   
      new_post_data = []
      if post_data and post_data.size > 0
        post_data.each_pair do |key, value|
          new_post_data.push("#{key}=#{CGI.escape value}")
        end
      end
      post_data = new_post_data.join('&')

      result = case method
                 when 'get'
                   get(rq)
                 when 'post'
                   post(rq, post_data)
                 when 'put'
                   put(rq, post_data)
                 when 'delete'
                   delete(rq)
               end

      case result
        when Net::HTTPSuccess
          JSON.parse(result.body)
        else
          result.error!
      end
    end

    private

    def delete(uri)
      call(Net::HTTP::Delete.new(uri), uri)
    end

    def get(uri)
      call(Net::HTTP::Get.new(uri), uri)
    end

    def put(uri, post_data)
      req = Net::HTTP::Put.new(uri)
      req.body = post_data
      call(req, uri)
    end

    def post(uri, post_data)
      req = Net::HTTP::Post.new(uri)
      req.body = post_data
      call(req, uri)
    end

    def call(req, uri)
      uri = URI.parse(uri)
      res = Net::HTTP.start(uri.host, uri.port) do |http|
        http.request(req)
      end

      res
    end

  end
end
