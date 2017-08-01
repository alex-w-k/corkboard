require 'rails_helper'

RSpec.describe "As a pro" do

  it "can withdraw a bid" do
    bid = create(:bid)
    pro = bid.pro

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(pro)

    visit bid_path(bid)

    expect(Bid.last.status).to eq("open")
    click_button "Withdraw"
    expect(current_path).to eq(pro_dashboard_index_path)
    expect(Bid.last.status).to eq("withdrawn")
  end
  
end
