require 'rails_helper'

RSpec.describe "A user has a project and bids" do

  context "accepts one bid" do

    it "accepted bid status changes to accepted" do
      bid = create(:bid)
      user = bid.project.requester

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit bid_path(bid)

      expect(Bid.last.status).to eq("open")
      click_button "Accept"
      expect(current_path).to eq(project_path(bid.project))
      expect(Bid.last.status).to eq("accepted")
    end

    it "all other project bid statuses change to rejected" do
      project = create(:project)
      pro = create(:pro_user)
      pro2 = create(:pro_user)
      bid = project.bids.create(comment: "hello", project_id: 1, user_id: pro.id, amount: 800)
      bid2 = project.bids.create(comment: "goodbye", project_id: 1, user_id: pro2.id, amount: 890)

      user = bid.project.requester

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit bid_path(bid)

      expect(Bid.first.status).to eq("open")
      click_button "Accept"
      expect(current_path).to eq(project_path(bid.project))
      expect(Bid.first.status).to eq("accepted")
      expect(Bid.last.status).to eq("rejected")
    end
  end



end
