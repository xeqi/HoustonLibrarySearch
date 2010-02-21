require 'spec/spec_helper'

describe HPL do
  it "should have a url" do
    HPL.url(1).should == "http://catalog.houstonlibrary.org/search~S0/?searchtype=i&searcharg=1"
  end

  it "should parse a listing" do
    listing = HPL.parse(load_fixture("HPL"))[0]
    listing.location.should  == "Central Nonfiction CIRC - 2nd  3rd fls"
    listing.call_number.should == "542 K16"
    listing.status.should ==  "Check shelf"
    listing.due_date.should ==  ""
  end

  it "should have a name" do
    HPL.name.should == "Houston Public Library"
  end
end
