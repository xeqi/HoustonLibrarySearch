begin
  # Try to require the preresolved locked set of gems.
  require File.expand_path('../.bundle/environment', __FILE__)
rescue LoadError
  # Fall back on doing an unlocked resolve at runtime.
  require "rubygems"
  require "bundler"
  Bundler.setup
end

require "curb"
require "nokogiri"
require File.join(File.expand_path(File.dirname(__FILE__)), "listing.rb")

Dir[File.join(File.expand_path(File.dirname(__FILE__)), "plugins/*.rb")].each {|file| require file }

class HoustonLibrarySearch
  def self.search(isbn)
    multi = Curl::Multi.new
    results = {}
    [HPL, HCPL].each do |library|
      c = Curl::Easy.new(library.url(isbn)) do |curl|
        curl.on_success do |data|
          #TODO Handle parse errors
          #TODO Add mechanism for multiple page responses
          results.merge!({library.name => library.parse(data.body_str)})
        end
      end
      multi.add(c)
    end

    multi.perform do
      #TODO Include a timeout
    end
    results
  end
end
