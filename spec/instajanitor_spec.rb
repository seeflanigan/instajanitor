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
    context "there are no unfollow suggestions" do
      it "returns an empty hash {}" do
        janitor = InstaJanitor.new('123454321')

	expect(janitor.show_unfollow_suggestions).to eq({})
      end
    end
  end

  xdescribe "get_following" do
    context "user isn't following anyone" do
      it "returns a message" do
        expected = "This user is not following anyone"

        janitor = InstaJanitor.new
        expect(janitor.get_following).to eq(expected)
      end
    end

    context "user is following one account" do
      it "returns the account" do

      end
    end

    context "user is following multiple accounts" do

    end
  end
end
