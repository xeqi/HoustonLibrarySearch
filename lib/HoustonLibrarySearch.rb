require "curb"
require "nokogiri"
require File.join(File.expand_path(File.dirname(__FILE__)), "HoustonLibrarySearch/listing.rb")
require File.join(File.expand_path(File.dirname(__FILE__)), "HoustonLibrarySearch/isbn.rb")

Dir[File.join(File.expand_path(File.dirname(__FILE__)), "plugins/*.rb")].each {|file| require file }
