begin
  # Try to require the preresolved locked set of gems.
  require File.expand_path('../.bundle/environment', __FILE__)
rescue LoadError
  # Fall back on doing an unlocked resolve at runtime.
  require "rubygems"
  require "bundler"
  Bundler.setup(:test, :default)
end

require 'HoustonLibrarySearch'

def load_fixture(filename)
  File.read("#{File.dirname(__FILE__)}/fixtures/#{filename}.html")
end
