require 'rails_helper'

describe "Projects API" do
  it "can return a list of all open projects for a user" do
    category =          create(:category)
    service =           create(:service, category_id: category.id)
    user = create(:user)
    10.times do |i|
      project = create(:project, service_id: service.id, requester_id: user.id, status: 0)
    end

    get "/api/v1/projects/find_all?id=#{user.id}&status=0"
    expect(response).to be_success

    projects = JSON.parse(response.body)
    project = project.first

    expect(projects.count).to eq(10)
    expect(project.requester_id).to eq(user.id)
    expect(item).to have_key("status")
    expect(item).to have_key("zipcode")
    expect(item).to have_key("description")
    expect(item).to_not have_key("created_at")
    expect(item).to_not have_key("updated_at")
    expect(item).to_not have_key("recurring")
    expect(item).to_not have_key("timeline")
    expect(item).to_not have_key("requester_id")
    expect(item).to_not have_key("latitude")
    expect(item).to_not have_key("longitude")
    expect(item).to_not have_key("service_id")
  end
end