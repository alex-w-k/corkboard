
require 'rails_helper'

RSpec.describe "Guest Facebook OAuth Process" do

  before(:each) do
    stub_omniauth
  end

  it "guest can create an account" do

    visit facebook_login_path

    expect(page).to have_field("user[first_name]", with: 'Riley')
    expect(page).to have_field("user[last_name]", with: 'Thompson')
    expect(page).to have_field('user[email]', with: 'rileyt_111@hotmail.com')

    fill_in "user[zipcode]", with: "79720"
    fill_in "user[country_code]", with: '1'
    fill_in "user[phone_number]", with: "3944568"


    click_on "Create Account"

    expect(current_path).to eq(verify_path)

    latest_user = User.last

    expect(latest_user.first_name).to eq("Riley")
    expect(latest_user.email).to eq("rileyt_111@hotmail.com")
  end
end
