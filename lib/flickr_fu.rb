require 'rubygems'
require 'xml_magic'
require 'net/http'
require 'cgi'
require 'uri'
require 'open-uri'
require 'mime/types'
require 'digest/md5'
require 'yaml'
require 'time'
require 'date'
require 'rest_client'

# base must load first
%w(base test auth token photos photo photo_response photo_sets photo_set uploader status comment note size people person license errors contacts contact).each do |file|
  require File.join(File.dirname(__FILE__), 'flickr', file)
end

include CommonThread::XML

class Object
  # returning allows you to pass an object to a block that you can manipulate returning the manipulated object
  def returning(value)
    yield(value)
    value
  end
end
