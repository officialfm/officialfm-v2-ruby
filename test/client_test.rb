require 'helper'

class ClientTest < Test::Unit::TestCase

  context "OfficialFM::Client" do

    should "use the configuration set with OfficialFM.configure by default" do
      API_KEY = "test key"

      OfficialFM.configure do |s|
        s.api_key = API_KEY
      end

      OfficialFM.api_key.should == API_KEY
      OfficialFM::Client.new.api_key.should == API_KEY
    end


    should "be able to override the default configuration" do
      DEFAULT_API_KEY = "test key"
      CUSTOM_API_KEY = "other test key"

      OfficialFM.configure do |s|
        s.api_key = DEFAULT_API_KEY
      end

      client = OfficialFM::Client.new(:api_key => CUSTOM_API_KEY)
      client.api_key.should == CUSTOM_API_KEY

    end

    context "#resource_url" do
      setup do
        @base_url = 'http://example.com'
        @client = OfficialFM::Client.new
      end

      should "not change the base paths of complete URLs" do
        @client.send(:resource_url, @base_url, 'something', 'child').start_with?(@base_url).should be(true)
      end

      should "build resource url from a base url" do
        @client.send(:resource_url, @base_url, 'something', 'child').should == 'http://example.com/child'
      end

      should "build resource url from an id" do
        @client.send(:resource_url, "42", "projects", "tracks").should == '/projects/42/tracks'
      end
    end

    context "#extend_resource" do
      setup do
        @client = OfficialFM::Client.new
      end

      should "add module methods to a client response object" do
        #TODO
      end

    end

  end

end
