require 'spec/spec_helper'

describe HoustonLibrarySearch::Listing do

  before(:each) do
    @listing = HoustonLibrarySearch::Listing.new("location", "call number", "status", "10-9-09")
  end

  it "should have a status" do
    @listing.status.should == "status"
  end

  it "should normalize due date" do
    @listing.due_date.should == "10/9/09"
  end

  it "should have a location" do
    @listing.location.should  == "location"
  end

  it "should have a call number" do
    @listing.call_number.should == "call number"
  end

end
