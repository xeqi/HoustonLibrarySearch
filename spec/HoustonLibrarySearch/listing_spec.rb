require 'spec/spec_helper'

describe Listing do

  before(:each) do
    @listing = Listing.new("location", "call number", "status", "due date")
  end

  it "should have a status" do
    @listing.status.should == "status"
  end

  it "should have a due date" do
    @listing.due_date.should == "due date"
  end

  it "should have a location" do
    @listing.location.should  == "location"
  end

  it "should have a call number" do
    @listing.call_number.should == "call number"
  end

end
