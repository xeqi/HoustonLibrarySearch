
class HCPL
  def self.url(isbn)
    "http://catalog.hcpl.net/ipac20/ipac.jsp?index=ISBNEXH&term=#{isbn}"
  end

  def self.parse(html)
    xml = Nokogiri::XML.parse(html)
    results = xml.css(".tableBackground .tableBackground .tableBackground .tableBackground .tableBackground .tableBackground").collect do |table|
      trs = table.css("tr")
      # TODO handle muliple book returns
      # Currently mask multiple books as no results
      # see isbn 0887307280
      if(trs[0].css("td")[0].css("a").text =~ /Location/)
        trs[1, trs.length-1].collect do |tr|
          tds = tr.css("td")
          due_date = ''
          due_date = tds[4].text if tds[4]
          HoustonLibrarySearch::Listing.new(tds[0].text, tds[2].text, tds[3].text, due_date)
        end
      end
    end
    #handle masking
    results = results.select{|x| x}
    results.flatten
  end

  def self.name
    "Harris County Public Library"
  end
end
