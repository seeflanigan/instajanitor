# require "spec_helper"
require "instajanitor"

describe InstaJanitor do
  describe "initialization" do
    it "receives an instagram user id and returns an instance" do
      janitor = InstaJanitor.new('123454321')

      expect(janitor).to be_a(InstaJanitor)
    end
  end

  describe "show_unfollow_suggestions" do
    context "when there are no unfollow suggestions" do
      it "returns an empty array" do
        janitor = InstaJanitor.new('123454321')

	expect(janitor.show_unfollow_suggestions).to eq([])
      end
    end

    context "when there is one unfollow suggestion" do
      it "returns an array with one suggestion hash" do
        janitor = InstaJanitor.new('1111')
	suggestion = {
          ig_user_id: '2222',
	  ig_user_name: 'bigfish',
	  followers_count: '100000'
	}

	expected = [suggestion]

	expect(janitor.show_unfollow_suggestions).to eq(expected)
      end
    end

    context "when there are multiple unfollow suggestions" do
      it "returns an array with many hashes, ordered by follower count" do
        janitor = InstaJanitor.new('1111')

	suggestion1 = {
          ig_user_id: '2222',
	  ig_user_name: 'bigfish',
	  followers_count: '100000'
	}

	suggestion2 = {
          ig_user_id: '3333',
	  ig_user_name: 'biggerfish',
	  followers_count: '200000'
	}

	expected = [suggestion2, suggestion1]

	expect(janitor.show_unfollow_suggestions).to eq(expected)
      end
    end

  end
end
