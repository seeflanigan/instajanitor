# require "spec_helper"
require "instajanitor"

describe InstaJanitor do
  describe "get_following" do
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
