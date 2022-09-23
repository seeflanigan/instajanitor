require 'instagram_api'

require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

describe InstagramApi do
  describe "initialization" do
    it "receives an API key" do
      api = InstagramApi.new(random_api_key)

      expect(api).to be_a(InstagramApi)
    end
  end

  describe "#following" do
    before(:each) do
      stub_request(:get, /following/).
        with(query: hash_including({"user_id" => ig_user_id})).
	to_return(status: 200, body: api_response_body)
    end

    it "accepts an instagram user id" do
      api = InstagramApi.new(random_api_key)
      result = api.following(ig_user_id)

      expect{ result }.not_to raise_error
    end

    it "returns the http response body" do
      api = InstagramApi.new(random_api_key)
      result = api.following(ig_user_id)

      expect(result).to eq(api_response_body)
    end
  end

  :private
  def ig_user_id
    "1111"
  end

  def random_api_key
    range = [*'0'..'9',*'A'..'Z',*'a'..'z']
    Array.new(50){ range.sample }.join
  end

  def api_response_body
    "{\"data\":{\"user\":{\"edge_follow\":{\"count\":2893,\"page_info\":{\"has_next_page\":true,\"end_cursor\":\"QVFCRE9xZlBfaWJxWnJtR2RQMFkwOFpZbm5BMERmSWRfYlcyb3BIX1hna1l2a2hfdHdLSXU1M0lJcS1GMnBwbkgyQWExUk91bWw5ZlFMcnhvUEVaQVpiaA==\"},\"edges\":[{\"node\":{\"id\":\"5885901083\",\"username\":\"nutritionstutorial\",\"full_name\":\"Nutrition Guide\",\"profile_pic_url\":\"https://scontent-sjc3-1.cdninstagram.com/v/t51.2885-19/81695792_172617707386037_32754090614194176_n.jpg?stp=dst-jpg_s150x150&_nc_ht=scontent-sjc3-1.cdninstagram.com&_nc_cat=1&_nc_ohc=DsubddASE5sAX_luHFT&edm=ANg5bX4BAAAA&ccb=7-5&oh=00_AT9jeYz2kvP1BysdzzW-bwJDtnx6hC3WB7_sqSRMyyEpcg&oe=6333CC7D&_nc_sid=55937d\",\"is_private\":false,\"is_verified\":false,\"followed_by_viewer\":false,\"requested_by_viewer\":false}}]}}},\"status\":\"ok\"}"
  end
end
