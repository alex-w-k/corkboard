require 'rails_helper'

describe "Projects API" do
  it "can update a project" do
    category =          create(:category)
    service =           create(:service,
                              category_id: category.id)
    user =              create(:user)
    project = create(:project,
                      service_id: service.id,
                      requester_id: user.id,
                      status: 1)
    id = project.id
    previous_status = project.status
    project_params = {status: 'closed'}

    put "/api/v1/projects/#{id}", params: {project: project_params}

    expect(response).to be_success
    updated_project = Project.find_by(id: id)

    expect(updated_project.status).to eq('closed')
    expect(updated_project.status).to_not eq(previous_status)
  end

  it "can return a list of all open projects for a user" do
    category =          create(:category)
    service =           create(:service,
                              category_id: category.id)
    user =              create(:user)
    10.times do |i|
      project = create(:project,
                      service_id: service.id,
                      requester_id: user.id,
                      status: 0)
    end

    8.times do |i|
      project = create(:project,
                      service_id: service.id,
                      requester_id: user.id,
                      status: 1)
    end

    get "/api/v1/projects/find_all?requester_id=#{user.id}&status=0"
    expect(response).to be_success

    projects = JSON.parse(response.body)
    project = projects.first

    expect(projects.count).to eq(10)
    expect(project).to have_key("id")
    expect(project["requester_id"]).to eq(user.id)
    expect(project).to have_key("status")
    expect(project).to have_key("zipcode")
    expect(project).to have_key("description")
    expect(project).to have_key("created_at")
    expect(project).to have_key("updated_at")
    expect(project).to have_key("recurring")
    expect(project).to have_key("timeline")
    expect(project).to have_key("requester_id")
    expect(project).to have_key("latitude")
    expect(project).to have_key("longitude")
    expect(project).to have_key("service_id")
  end

  it "can return a list of all accepted projects for a user" do
    category =          create(:category)
    service =           create(:service,
                              category_id: category.id)
    user =              create(:user)
    10.times do |i|
      project = create(:project,
                      service_id: service.id,
                      requester_id: user.id,
                      status: 0)
    end

    8.times do |i|
      project = create(:project,
                      service_id: service.id,
                      requester_id: user.id,
                      status: 1)
    end

    get "/api/v1/projects/find_all?requester_id=#{user.id}&status=1"
    expect(response).to be_success

    projects = JSON.parse(response.body)
    project = projects.first

    expect(projects.count).to eq(8)
    expect(project["requester_id"]).to eq(user.id)
    expect(project).to have_key("status")
    expect(project).to have_key("zipcode")
    expect(project).to have_key("description")
    expect(project).to have_key("created_at")
    expect(project).to have_key("updated_at")
    expect(project).to have_key("recurring")
    expect(project).to have_key("timeline")
    expect(project).to have_key("requester_id")
    expect(project).to have_key("latitude")
    expect(project).to have_key("longitude")
    expect(project).to have_key("service_id")
  end

  it "can return a list of all closed projects for a user" do
    category =          create(:category)
    service =           create(:service,
                              category_id: category.id)
    user =              create(:user)
    10.times do |i|
      project = create(:project,
                      service_id: service.id,
                      requester_id: user.id,
                      status: 2)
    end

    8.times do |i|
      project = create(:project,
                      service_id: service.id,
                      requester_id: user.id,
                      status: 1)
    end

    get "/api/v1/projects/find_all?requester_id=#{user.id}&status=2"
    expect(response).to be_success

    projects = JSON.parse(response.body)
    project = projects.first

    expect(projects.count).to eq(10)
    expect(project["requester_id"]).to eq(user.id)
    expect(project).to have_key("status")
    expect(project).to have_key("zipcode")
    expect(project).to have_key("description")
    expect(project).to have_key("created_at")
    expect(project).to have_key("updated_at")
    expect(project).to have_key("recurring")
    expect(project).to have_key("timeline")
    expect(project).to have_key("requester_id")
    expect(project).to have_key("latitude")
    expect(project).to have_key("longitude")
    expect(project).to have_key("service_id")
  end
end