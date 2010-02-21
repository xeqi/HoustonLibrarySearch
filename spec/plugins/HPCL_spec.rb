require 'spec/spec_helper'

describe HCPL do
  it "should have a url" do
    HCPL.url(1).should == "http://catalog.hcpl.net/ipac20/ipac.jsp?index=ISBNEXH&term=1"
  end

  it "should parse a listing" do
    listing = HCPL.parse(load_fixture("HCPL"))[0]
    listing.location.should  == "Cy-Fair Library"
    listing.call_number.should == "005.1 Sei"
    listing.status.should ==  "Checked out"
    listing.due_date.should ==  "03/06/2010"
  end

  it "should have a name" do
    HCPL.name.should == "Harris County Public Library"
  end
end
