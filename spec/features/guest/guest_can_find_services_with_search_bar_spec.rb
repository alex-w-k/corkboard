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

  it "is redirected if no search matches" do
    visit root_path
    fill_in :service_search, with: ""
    click_on "Get Started"

    expect(current_path).to eq(home_search_index_path)
    expect(page).to have_content("Sorry we couldn't find what you were looking for")
    expect(page).to have_link("Please try your search again")
  end
end
