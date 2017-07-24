require 'rails_helper'

RSpec.describe "As a guest" do
  it "can browse industry with the search bar" do
    industry = create(:industry, name: 'Events')

    visit root_path
    fill_in :service_search, with: "Events"
    click_on "Get Started"
    
    expect(current_path).to eq(hire_industry_path(industry))
  end

  it "can browse services with the search bar" do
    industry = create(:industry, name: 'Events')
    category = create(:category, name: 'Driver', industry_id: industry.id)

    visit root_path
    fill_in :service_search, with: "Driver"
    click_on "Get Started"
    
    expect(current_path).to eq(hire_industry_category_path(industry, category))
  end

  it "can browse services with search bar" do
    industry = create(:industry, name: 'Events')
    category = create(:category, name: 'Driver', industry_id: industry.id)
    service = create(:service, name:"Personal Driver", category_id: category.id)
    visit root_path
    fill_in :service_search, with: "Personal Driver"
    click_on "Get Started"

    expect(current_path).to eq(new_hire_project_path(service))
  end

end
