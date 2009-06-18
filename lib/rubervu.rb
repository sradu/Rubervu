# Copyright (c) 2009 Radu Spineanu
# You can redistribute it and/or modify it under the same terms as Ruby.
#

require 'rubygems'
require 'digest/md5'
require "cgi"
require 'net/http'
require 'json'
require 'json/ext'

# Rubervu module contains a Rubervu connection class and different Rubervu Classes
module Rubervu
  FORMAT      = "json"
  API_VER     = "1.1"
end

require 'rubervu/ubervu'
require 'rubervu/ubervu_resource'
require 'rubervu/ubervu_reaction'
