require 'rails_helper'

RSpec.describe "As a guest" do
  it "can browse services with the search bar" do
    industry = create(:industry, name: 'Events')
    category = create(:category, name: 'Driver', industry_id: industry.id)

    visit root_path
    fill_in :service_search, with: "Driver"
    click_on "Get Started"
    
    expect(current_path).to eq(hire_industry_category_path(industry, category))
  end
end
