require 'rails_helper'

RSpec.describe "User can login with form" do

let!(:user) { create(:user) }

  it "user can login" do

    visit login_path
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: "hunter2"

    click_on "Login"

    expect(current_path).to eq('/profile/dashboard')
    expect(page).to have_content("Logout")
    expect(page).to have_content("Dashboard")
    expect(page).to_not have_content("Login")
    expect(page).to_not have_content("Sign Up")
  end
end
