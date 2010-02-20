require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "HoustonLibrarySearch"
    gemspec.summary = "Search Houston area libraries for ISBNs"
    gemspec.description = "Search Houston area libraries for ISBNs"
    gemspec.email = "nmorris@nelsonmorris.net"
    gemspec.homepage = "http://github.com/xeqi/HoustonLibrarySearch"
    gemspec.authors = ["Nelson Morris"]
    gemspec.files =  FileList["[A-Z]*", "{lib,test}/**/*"]
    gemspec.add_dependency 'curb'
    gemspec.add_dependency 'nokogiri'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end
