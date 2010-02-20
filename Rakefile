require 'rubygems'
require 'rake'
require 'rake/clean'

CLOBBER.include("pkg")
CLOBBER.include("*.gemspec")

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
    gemspec.add_dependency 'curb', ">= 0.6.6.0"
    gemspec.add_dependency 'nokogiri', ">= 1.4.1"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end
