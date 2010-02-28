module HoustonLibrarySearch
  class ISBN 
    attr_accessor :plugins

    def initialize(multifactory = lambda { return Curl::Multi.new}, easyfactory = lambda {|url, &blk| Curl::Easy.new(url,&blk); })
      @plugins = [HPL,HCPL]
      @multifactory = multifactory
      @easyfactory = easyfactory
    end

    def search(isbn)
      results = {}
      unless @plugins.empty?
        multi = @multifactory.call
        @plugins.each do |library|
          c = @easyfactory.call(library.url(isbn)) do |curl|
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
      end
      results
    end
  end
end
