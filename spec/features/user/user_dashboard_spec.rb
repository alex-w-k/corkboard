require "rails_helper"

RSpec.describe "As a logged in user" do
  scenario "dashboard shows all current projects" do
    user = create(:user)
    category = create(:category)
    service = create(:service, category_id: category.id)
    project1 = create(:project, service_id: service.id, requester_id: user.id)
    project2 = create(:project, service_id: service.id,requester_id: user.id, status: 1)
    project3 = create(:project, service_id: service.id,requester_id: user.id, status: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit profile_dashboard_path

    expect(page).to have_selector('.open-project')
    expect(page).to have_selector('.accepted-project')
    expect(page).to have_selector('.closed-project')
  end
end