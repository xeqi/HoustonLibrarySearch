# Houston Library Search

Search Houston area libraries for books.

## Install

gem install HoustonLibrarySearch

## Usage

    parser = HoustonLibrarySearch::ISBN.new
    hash = parser.search(isbn)
    hash.each do |library_name listings|
      puts library_name
      listings.each {|l| puts "#{l.location} #{l.call_number} #{l.status} #{l.due_date}"}
    end

##Libraries supported

Harris County Public Library
Houston Public Library
