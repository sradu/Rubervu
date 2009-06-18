# Copyright (c) 2009 Radu Spineanu
# You can redistribute it and/or modify it under the same terms as Ruby.
#

module Rubervu

  # This class creates API calls for different Reaction functions.
  # How to Use:
  #          ubervu = Rubervu::Ubervu.new('API_KEY')
  #          result = ubervu.reactions.show(url, {:page => 1, :perpage => 25})
  #
  class UbervuReaction < Ubervu

    # Initializes the UbervuReaction Class.
    def initialize(api_key, api_url = 'http://api.ubervu.com')
      @api_key    = api_key
      @api_url    = api_url
      @resource   = 'reactions'
    end

    # Get reactions about a specific URL.
    #
    # See: http://developer.contextvoice.com/docs/api_methods_11/Get_reactions_for_URL
    #
    # Requires - url:String
    #          - options:Array (:since, :include, :exclude, :filter, :page, :perpage, :order (asc or desc) supported)
    def show url, options = {}
      function = ''

      options ||= {}
 
      params = {}
      params[:url] = url

      options ||= {}
      options.each { |key,value| params[key] = value.to_s }
      
      request(@resource, function, params)
    end

  end
end
