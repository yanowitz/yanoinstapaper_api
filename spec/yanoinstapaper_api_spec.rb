$: << "#{File.dirname(__FILE__)}/../lib"
require 'yanoinstapaper_api'

describe YanoInstapaper::API do
  before(:each) do 
    @ip = YanoInstapaper::API.new
  end

  describe "exception generation" do
    it "should raise exception on non-200 response"

    it "should include useful debugging information in an exception"
  end

  describe "authentication" do
    it "should verify username and password for simple API authentication" do
      mock_conn = mock(Faraday::Connection)
      auth = {:username => 'drdolittle', :password => 'hatesanimals' }
      mock_conn.should_receive(:post).with( 'authenticate', auth )
      @ip.should_receive(:connection).and_return(mock_conn)
      @ip.authenticate( auth )
    end

    it "should handle oauth authentication"

    it "should expose oauth tokens for later storage/retrieval"
  end

  describe "premature meta optimizations" do 
    it "should memoize api namespace objects" do
      bookmark_obj = @ip.bookmarks
      @ip.bookmarks.object_id.should == bookmark_obj.object_id
    end

    it "should emit methods on method_missing calls" do
      @ip.bookmarks.respond_to?(:list).should be_false
      @ip.should_receive(:access).with('bookmarks/list',nil).and_return([])
      @ip.bookmarks.list
      @ip.bookmarks.respond_to?(:list).should be_true
      @ip.should_receive(:access).with('bookmarks/list',:answer => 42, :illuminati => [2,3,5,23]).and_return([])
      @ip.bookmarks.list( :answer => 42, :illuminati => [2,3,5,23] )
    end
  end

  describe "#access" do
    it "should convert API endpoint error codes into exceptions" do
      connection = mock
    end

    it "should handle HTML being returned when document is fetched" do
    end
  end

  describe "API endpoints" do
    it "should translate method_missing invocations into API calls" do
      @ip.should_receive(:access).with('bookmarks/list',nil).and_return([])
      @ip.bookmarks.list
    end

    it "should handle api endpoints that take arguments and translate into API calls" do
      args = { :limit => 10, :have => [1,2,3,4] }
      @ip.should_receive(:access).with('bookmarks/list',args ).and_return([])
      @ip.bookmarks.list(args)
    end

    it "should handle returning HTML for #get_text"
  end
end
