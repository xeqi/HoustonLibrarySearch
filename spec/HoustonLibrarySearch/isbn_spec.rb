require 'spec/spec_helper'

describe HoustonLibrarySearch::ISBN do

  before(:each)  do
    @multifactory = mock('multifactory')
    @easyfactory = mock('easyfactory')
    @isbn = HoustonLibrarySearch::ISBN.new(@multifactory, @easyfactory)
  end

  it "should have default plugins" do
    @isbn.plugins.should include(HPL,HCPL)
  end

  it "should allow changing plugins" do
    @isbn.plugins = []
    @isbn.plugins.should be_empty
  end

  it "should not use the factories if plugins is empty" do
    @isbn.plugins = []
    @isbn.search('').should be_empty
  end 

  it "should use plugins to scrape data" do
    data = mock('data')
    html = mock('html')
    name = mock('name')
    isbn = mock('isbn')
    url = mock('url')
    plugin = mock('plugin')
    results = mock('results')
    multi = mock('multi')
    easy_yield = mock('easy_yield')
    easy = mock('easy')

    plugin.should_receive(:url).with(isbn).once.and_return(url)
    plugin.should_receive(:parse).with(html).once.and_return(results)
    plugin.should_receive(:name).once.and_return(name)
    @multifactory.should_receive(:call).once.and_return(multi)
    @easyfactory.should_receive(:call).once.and_yield(easy_yield).and_return(easy)
    easy_yield.should_receive(:on_success).once.and_yield(data)
    data.should_receive(:body_str).once.and_return(html)
    multi.should_receive(:add).with(easy).once
    multi.should_receive(:perform).once

    @isbn.plugins = [plugin]
    @isbn.search(isbn).should == {name => results}
  end 
end
