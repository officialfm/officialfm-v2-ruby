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
        options = {
          parent: 'foo',
          child:  'bar'
        }

        @client.send(:resource_url, @base_url, options).start_with?(@base_url).should be(true)
      end

      should "build resource url from a base url" do
        options = {
          parent: 'foo',
          child:  'bar'
        }

        @client.send(:resource_url, @base_url, options).should == 'http://example.com/bar'
      end

      should "build resource url from an id" do
        options = {
          parent: 'foo',
          child:  'bar'
        }
        @client.send(:resource_url, '42', options).should == '/foo/42/bar'
      end

      should "build url for resource without child" do
        @client.send(:resource_url, '42', parent: 'foo').should == '/foo/42'
      end

      should "build url for resource without parent" do
        @client.send(:resource_url, 'user', child: 'profile').should == '/user/profile'
      end

      should "build url for resource without parent or child" do
        @client.send(:resource_url, 'greeting').should == '/greeting'
      end

      should "raise an error when resource id is nil" do
        lambda {@client.send(:resource_url, nil)}.should raise_error
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
