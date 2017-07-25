require 'rails_helper'

RSpec.describe "As a user" do
  it "can browse industry with the nav search bar" do
    user = create(:user)
    industry = create(:industry, name: 'Events')
    visit login_path
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: 'hunter2'
    click_on 'Login'
    fill_in "service_search", with: "Events"
    within('form') do
      find('button').click
    end

    
    expect(current_path).to eq(hire_industry_path(industry))
  end

  it "can browse services with the nav search bar" do
    user = create(:user)
    industry = create(:industry, name: 'Events')
    category = create(:category, name: 'Driver', industry_id: industry.id)
    visit login_path
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: 'hunter2'
    click_on 'Login'
    fill_in "service_search", with: "Driver"
    within('form') do
      find('button').click
    end
    
    
    expect(current_path).to eq(hire_industry_category_path(industry, category))
  end

  it "is redirected if no search matches" do
    user = create(:user)
    visit login_path
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: 'hunter2'
    click_on 'Login'
    fill_in "service_search", with: ""
    within('form') do
      find('button').click
    end

    expect(current_path).to eq(home_search_index_path)
    expect(page).to have_content("Sorry we couldn't find what you were looking for")
    expect(page).to have_link("Please try your search again")
  end
end
