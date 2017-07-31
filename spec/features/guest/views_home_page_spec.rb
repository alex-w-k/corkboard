require 'rails_helper'

RSpec.feature "view home page as a guest" do
  xscenario "views root page" do
    visit root_path

    expect(page).to have_link("Sign Up")
    expect(page).to have_link("Log In")

    within('.icons') do
      expect(page).to have_css('#home-link')
      expect(page).to have_css('#events-link')
      expect(page).to have_css('#lessons-link')
      expect(page).to have_css('#wellness-link')
      expect(page).to have_css('#crafts-link')
      expect(page).to have_css('#design-web-link')
      expect(page).to have_css('#pets-link')
    end


  end
end
