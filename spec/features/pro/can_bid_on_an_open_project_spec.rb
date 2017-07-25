require 'rails_helper'

RSpec.describe 'a logged-in pro can place a bid on an open project' do
  let!(:pro) { create(:pro_user) }
  let!(:pro_service) { pro.pro_services.create(service: service, pro: pro, radius: 100) }
  let!(:project) { create(:project, service: service) }
  let!(:service) { create(:service, category: category) }
  let!(:category)  { create(:category, name: 'Lawn & Garden', industry: industry) }
  let!(:industry)  { create(:industry, name: 'Home Improvement')}

  it "will let the pro place a bid" do
    page.set_rack_session(user_id: pro.id, authenticated: true)
    visit pro_dashboard_open_projects_path
    click_on "View"

    expect(current_path).to eq(pro_dashboard_open_project_path(project))

    fill_in "bid[amount]", with: "100"
    fill_in "bid[comment]", with: "I'd like to work on this project."

    click_on "Place Bid"

    expect(current_path).to eq(pro_dashboard_project_bids_path)

    bid = Bid.last
    expect(bid.amount).to eq("100")
    expect(bid.comment).to eq("I'd like to work on this project.")
    expect(bid.status).to eq("open")
  end
end
