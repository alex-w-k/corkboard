require 'rails_helper'

RSpec.describe 'user creates a project' do
  let!(:industry) { create(:industry, name: 'Home Improvement') }
  let!(:category) { create(:category, name: 'Lawn Care', industry: industry) }
  let!(:service)  { create(:service, name: 'Mowing', category: category) }
  let!(:user)     { create(:user) }

  scenario 'with valid inputs' do
    page.set_rack_session(user_id: user.id)
    page.set_rack_session(authenticated: true)

    visit root_path

    click_link('home-link')
    expect(current_path).to eq('/hire/home-improvement')

    click_link("#{category.slug}")
    expect(current_path).to eq('/hire/home-improvement/lawn-care')

    click_on("#{service.slug}")
    expect(current_path).to eq('/hire/mowing/new')

    expect(page).to have_css('.project-form')

    fill_in('project[zipcode]', :with => '80210')
    choose('Recurring')
    fill_in('project[description]', :with => 'This is a project that I need done right away')
    choose('ASAP')

    expect(page).to_not have_content('Login or Sign Up to request this project')
        # save_and_open_page
    page.attach_file("project[attachments_attributes][0][upload]", Rails.root + "spec/support/fixtures/image.png") 
    # binding.pry
    click_on 'Submit'

    new_project = Project.last
    attachment = Attachment.first

    expect(Project.count).to eq(1)
    expect(Attachment.count).to eq(1)
    expect(current_path).to eq(new_project_confirmation_path(new_project))
    expect(new_project.status).to eq("open")
    expect(new_project.zipcode).to eq("80210")  
    expect(new_project.recurring).to be true
    expect(new_project.description).to eq("This is a project that I need done right away")
    expect(new_project.requester).to eq(user)
    expect(attachment.upload_file_name).to eq('image.png')
    expect(attachment.upload_content_type).to eq('image/png')
    expect(attachment.upload_file_size).to eq(6773)
  end
end
