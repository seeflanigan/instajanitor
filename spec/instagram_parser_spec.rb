require 'instagram_parser.rb'
require 'pry'

describe InstagramParser do
  describe ".parse" do
    it "returns an array of hashes from an api response body" do
      result = InstagramParser.parse(api_response_body)

      expect(result).to be_a(Array)
    end

    context "response hash" do
      it "contains information about accounts followed by the user" do
	user_hash = {
          ig_user_id: "5885901083",
	  ig_username: "nutritionstutorial",
          is_verified: false,
	  is_private: false,
          follows_back: false
	}

        expected = [user_hash]
        result = InstagramParser.parse(api_response_body)

	expect(result).to eq(expected)
      end
    end
  end

  def api_response_body
    "{\"data\":{\"user\":{\"edge_follow\":{\"count\":2893,\"page_info\":{\"has_next_page\":true,\"end_cursor\":\"QVFCRE9xZlBfaWJxWnJtR2RQMFkwOFpZbm5BMERmSWRfYlcyb3BIX1hna1l2a2hfdHdLSXU1M0lJcS1GMnBwbkgyQWExUk91bWw5ZlFMcnhvUEVaQVpiaA==\"},\"edges\":[{\"node\":{\"id\":\"5885901083\",\"username\":\"nutritionstutorial\",\"full_name\":\"Nutrition Guide\",\"profile_pic_url\":\"https://scontent-sjc3-1.cdninstagram.com/v/t51.2885-19/81695792_172617707386037_32754090614194176_n.jpg?stp=dst-jpg_s150x150&_nc_ht=scontent-sjc3-1.cdninstagram.com&_nc_cat=1&_nc_ohc=DsubddASE5sAX_luHFT&edm=ANg5bX4BAAAA&ccb=7-5&oh=00_AT9jeYz2kvP1BysdzzW-bwJDtnx6hC3WB7_sqSRMyyEpcg&oe=6333CC7D&_nc_sid=55937d\",\"is_private\":false,\"is_verified\":false,\"followed_by_viewer\":false,\"requested_by_viewer\":false}}]}}},\"status\":\"ok\"}"
  end
end
