require "rails_helper"

RSpec.describe "As a user" do
  it "can visit a project show page" do
    user = create(:user)
    project = create(:project, requester_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit project_path(project)

    expect(page).to have_content(project.status)
    expect(page).to have_content(project.zipcode)
    expect(page).to have_content(project.description)
    expect(page).to have_content(project.created_at)
    expect(page).to have_content(project.timeline)
    expect(page).to have_content(project.service.name)
    expect(page).to have_css('img')
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