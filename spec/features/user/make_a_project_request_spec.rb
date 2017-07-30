require 'rails_helper'

RSpec.describe 'user creates a project' do
  let!(:industry) { create(:industry, name: 'Home Improvement') }
  let!(:category) { create(:category, name: 'Lawn Care', industry: industry) }
  let!(:service)  { create(:service, name: 'Mowing', category: category) }
  let!(:user)     { create(:user) }

  scenario 'with valid inputs' do
    page.set_rack_session(user_id: user.id)
    page.set_rack_session(authenticated: true)

    visit hire_industry_path(industry)

    click_link("#{category.name}")
    expect(current_path).to eq('/hire/home-improvement/lawn-care')

    click_on("#{service.slug}")
    expect(current_path).to eq('/hire/mowing/new')

    expect(page).to have_css('.project-form')

    fill_in('project[zipcode]', :with => '80210')
    choose('Recurring')
    fill_in('project[description]', :with => 'This is a project that I need done right away')
    choose('ASAP')

    expect(page).to_not have_content('Login or Sign Up to request this project')
    page.attach_file("project[attachments_attributes][0][upload]", Rails.root + "spec/fixtures/files/image.png") 
    click_on 'Submit'

    new_project = Project.last
    attachment = Attachment.first

    expect(Project.count).to eq(1)
    expect(Attachment.count).to eq(1)
    expect(current_path).to eq(new_project_confirmation_path(new_project))
    expect(attachment.upload_file_name).to eq('image.png')
    expect(attachment.upload_content_type).to eq('image/png')
    expect(attachment.upload_file_size).to eq(6773)

    expect(page).to have_content(new_project.status)
    expect(page).to have_content(new_project.zipcode)  
    expect(page).to have_content(new_project.recurring)
    expect(page).to have_content(new_project.description)
    expect(page).to have_css('img', count: 2)
  end
  scenario 'with valid inputs, no image' do
    page.set_rack_session(user_id: user.id)
    page.set_rack_session(authenticated: true)

    visit hire_industry_path(industry)

    click_link("#{category.name}")
    expect(current_path).to eq('/hire/home-improvement/lawn-care')

    click_on("#{service.slug}")
    expect(current_path).to eq('/hire/mowing/new')

    expect(page).to have_css('.project-form')

    fill_in('project[zipcode]', :with => '80210')
    choose('Recurring')
    fill_in('project[description]', :with => 'This is a project that I need done right away')
    choose('ASAP')

    expect(page).to_not have_content('Login or Sign Up to request this project')

    click_on 'Submit'

    new_project = Project.last
    attachment = Attachment.first

    expect(Project.count).to eq(1)
    expect(current_path).to eq(new_project_confirmation_path(new_project))
    expect(page).to have_content(new_project.status)
    expect(page).to have_content(new_project.zipcode)  
    expect(page).to have_content(new_project.recurring)
    expect(page).to have_content(new_project.description)
    expect(page).to have_css('img', count: 1)
  end
end
