require 'helper'

class TracksTest < Test::Unit::TestCase
  context "OfficialFM::Client" do

    setup do
      @client = OfficialFM::Client.new

      @stubs = Faraday::Adapter::Test::Stubs.new

      @client.connection.builder.adapter :test, @stubs
    end

    context "#tracks" do
    end

    context "#track" do
      should "return a track" do
        id = 42
        @stubs.get("/tracks/#{id}") {[200, {}, 'test']}

      end
    end
  end
end
