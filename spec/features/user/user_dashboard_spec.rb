require "rails_helper"

RSpec.describe "As a logged in user" do
  scenario "dashboard shows all current projects" do
    user = create(:user)
    project1 = create(:project, requester_id: user.id)
    project2 = create(:project, requester_id: user.id, status: 1)
    project3 = create(:project, requester_id: user.id, status: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit profile_dashboard_path


    within('.open') do
      expect(page).to have_content(project1.description)
      expect(page).to_not have_content(project2.description)
      expect(page).to_not have_content(project3.description)
    end

    within('.accepted') do
      expect(page).to have_content(project2.description)
      expect(page).to_not have_content(project1.description)
      expect(page).to_not have_content(project3.description)
    end
    
    within('.closed') do
      expect(page).to have_content(project3.description)
      expect(page).to_not have_content(project2.description)
      expect(page).to_not have_content(project1.description)
    end
  end
end