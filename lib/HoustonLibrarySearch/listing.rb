module HoustonLibrarySearch
  class Listing
    attr_reader :location, :call_number, :status, :due_date
  
    def initialize(location, call_number, status, due_date) 
      @location = location
      @call_number = call_number
      @status = status
      @due_date = normalize(due_date)
    end

    private
    def normalize(location)
      location.gsub(/-/,'/')
    end
  end
end
