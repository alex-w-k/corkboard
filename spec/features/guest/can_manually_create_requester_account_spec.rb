require 'rails_helper'

RSpec.describe "Guest Bcrypt Authentication Process" do
  it "guest can create an account" do
    visit '/'

    click_on "Sign Up"
    expect(current_path).to eq('/choose-account')
    click_on "Sign Up To Hire"

    fill_in "user[first_name]", with: "Arnold"
    fill_in "user[last_name]", with: "Schwarzenegger"
    fill_in "user[zipcode]", with: "79720"
    fill_in "user[email]", with: "arny22@gmail.com"
    fill_in "user[password]", with: "hunter2"
    fill_in "user[password_confirmation]", with: "hunter2"



    click_on "Create Account"

    expect(current_path).to eq(profile_dashboard_path)

    latest_user = User.last
    expect(latest_user.first_name).to eq("Arnold")
    expect(latest_user.email).to eq("arny22@gmail.com")
  end
  
  it "cannot leave fields blank" do
    visit '/'

    click_on "Sign Up"
    expect(current_path).to eq('/choose-account')
    click_on "Sign Up To Hire"
    click_on "Create Account"

    expect(current_path).to eq('/register')
    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
    expect(page).to have_content("Zipcode can't be blank")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Phone number can't be blank")
    expect(page).to have_content("Country code can't be blank")

  end
end
