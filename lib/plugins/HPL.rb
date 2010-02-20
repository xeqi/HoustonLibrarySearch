class HPL

  def self.url(isbn)
    "http://catalog.houstonlibrary.org/search~S0/?searchtype=i&searcharg=#{isbn}"
  end

  def self.parse(html)
    xml = Nokogiri::XML.parse(html)
    xml.css('.bibItemsEntry').collect do |table|
      due = ''
      row = table.css('td')
      status = row[3].text.strip
      if status =~ /DUE/
        due = status[4, 8]
        status = "Checked out"
      end
      Listing.new(row[0].text.strip, row[2].text.strip, status.capitalize, due)
    end
  end

  def self.name
    "Houston Public Library"
  end

end
