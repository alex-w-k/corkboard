require "rails_helper"

RSpec.describe "As a logged in user" do
  scenario "it can navigate to project show from dashboard" do
    user = create(:user)
    pro = create(:pro_user)
    category = create(:category)
    service = create(:service, category_id: category.id)
    project1 = create(:project, service_id: service.id, requester_id: user.id)
    bid = project1.bids.create(user_id: pro.id, amount: "100", comment: "I can help.")
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit profile_dashboard_path
    find("a[href='#{project_path(project1)}']").click
    
    expect(page).to have_content("Project Information:")    
    expect(page).to have_content(project1.description)
    expect(page).to have_content(project1.status)
    expect(page).to have_content(project1.service.name)
    expect(page).to have_content(project1.zipcode)
    expect(page).to have_xpath("//img[contains(@src, image.png)]")


    expect(page).to have_content("Bids:")
    expect(page).to have_content(bid.pro.first_name)
    expect(page).to have_content(bid.pro.last_name)
    expect(page).to have_content(bid.amount)
    expect(page).to have_content(bid.comment)
    expect(page).to have_content(bid.status)

    
  end

  it "cannot visit a project show page that they did not initiate" do
    user = create(:user)
    project = create(:project, requester_id: user.id)
    user2 = create(:user)
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user2)

    visit project_path(project)

    expect(page).to_not have_content(project.status)
    expect(page).to_not have_content(project.zipcode)
    expect(page).to_not have_content(project.description)
    expect(page).to_not have_content(project.created_at)
    expect(page).to_not have_content(project.timeline)
    expect(page).to_not have_content(project.service.name)
    expect(page).to have_content("404")
  end
end