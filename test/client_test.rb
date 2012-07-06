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

  end

end
