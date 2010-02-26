module HoustonLibrarySearch
  class ISBN 
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
end
