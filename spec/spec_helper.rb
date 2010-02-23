require 'HoustonLibrarySearch'

def load_fixture(filename)
  File.read("#{File.dirname(__FILE__)}/fixtures/#{filename}.html")
end
