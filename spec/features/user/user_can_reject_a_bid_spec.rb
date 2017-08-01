require 'rails_helper'

RSpec.describe "A user has a project and bids" do

  context "rejects one bid" do

    it "rejected bid status changes to rejected" do
      bid = create(:bid)
      user = bid.project.requester

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit bid_path(bid)

      expect(Bid.last.status).to eq("open")
      click_button "Reject"
      expect(current_path).to eq(project_path(bid.project))
      expect(Bid.last.status).to eq("rejected")
    end

  end
end
