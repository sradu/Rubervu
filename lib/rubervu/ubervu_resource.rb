# Copyright (c) 2009 Radu Spineanu
# You can redistribute it and/or modify it under the same terms as Ruby.
#

module Rubervu

  # This class creates API calls for different Resource functions.
  # How to Use:
  #          ubervu = Rubervu::Ubervu.new('API_KEY')
  #          result = ubervu.resources.show(url)
  #
  class UbervuResource < Ubervu

    # Initializes the UbervuResource Class.
    def initialize(api_key, api_url = 'http://api.ubervu.com')
      @api_key    = api_key
      @api_url    = api_url
      @resource   = 'resources'
    end

    # Get information about a specific URL.
    #
    # See: http://developer.ubervu.com/docs/api_methods/Get_information_about_a_specific_URL
    #
    # Requires - url:String
    def show url
      function = ''
 
      params = {}
      params[:url] = url

      request(@resource, function, params)
    end

    # Add a new resource.
    #
    # See: http://developer.ubervu.com/docs/api_methods/Add_a_new_resource
    #
    # Requires - url:String
    def create url
      function = ''
      
      post_data = {}
      post_data[:url] = url

      request(@resource, function, nil, 'post', post_data)
    end

    # Add a batch of new resources.
    #
    # See: http://developer.ubervu.com/docs/api_methods/Add_a_batch_of_new_resources
    #
    # Requires - urls:Array of urls
    def create_batch urls
      function = 'batch/'

      post_data = {}
      post_data[:urls] = urls.join(',')

      request(@resource, function, nil, 'post', post_data)
    end
  end
end
