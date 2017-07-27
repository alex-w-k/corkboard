require "rails_helper"

RSpec.describe "As a logged in user" do
  scenario "it can navigate to bid from project" do
    user = create(:user)
    pro = create(:pro_user)
    category = create(:category)
    service = create(:service, category_id: category.id)
    project1 = create(:project, service_id: service.id, requester_id: user.id)
    bid = project1.bids.create(user_id: pro.id, amount: "100", comment: "I can help.")
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit project_path(project1)
    find("a[href='#{bid_path(bid)}']").click
    expect(page).to have_content(project1.service.name)
    expect(page).to have_content("Your message:")
    expect(page).to have_css("button", count: 1)
    expect(page).to have_css('textarea', count: 1)
  end
end