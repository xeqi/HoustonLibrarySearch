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
    hash = {}
    [HPL, HCPL].collect do |x|
      hash.merge!({x.name => x.listings(isbn)})
    end
    hash
  end
end
