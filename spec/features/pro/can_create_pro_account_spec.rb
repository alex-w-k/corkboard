require 'rails_helper'

RSpec.describe "Guest can create Pro Process" do
  let!(:industry) { create(:industry, name: 'Home Improvement')}
  let!(:category) { create(:category, name: 'Lawn & Garden', industry: industry) }
  let!(:service_1) { create(:service, name: 'Lawn Mowing & Trimming', category: category) }
  let!(:service_2) { create(:service, name: 'Gardening', category: category) }
  let!(:service_3) { create(:service, name: 'Leaf Clean Up', category: category) }
  let!(:customer_role) { create(:customer) }
  let!(:pro_role) { create(:pro) }

  it "guest can manually create an account (with bcrypt)" do
    visit '/'

    click_on "Sign Up"
    expect(current_path).to eq('/choose-account')

    click_on "Join As a Pro"
    expect(current_path).to eq('/pro_register/industries')
    expect(page).to have_css(".industry-choices")

    within ".industry-choices" do
      expect(page).to have_content("Home Improvement")
    end

    click_on "Home Improvement"

    expect(current_path).to eq('/pro_register/home-improvement')
    within ".category-choices" do
      expect(page).to have_content("Lawn & Garden")
    end

    click_on 'Lawn & Garden'

    expect(current_path).to eq('/pro_register/home-improvement/lawn-garden')

    within ".service-choices" do
      expect(page).to have_content("Lawn Mowing & Trimming")
      expect(page).to have_content("Gardening")
      expect(page).to have_content("Leaf Clean Up")
    end

    find(:css, "#service_id_[value='#{service_1.id}']").set(true)
    find(:css, "#service_id_[value='#{service_2.id}']").set(true)
    find(:css, "#service_id_[value='#{service_3.id}']").set(false)

    click_on 'Submit'
    expect(current_path).to eq('/pro/new')

    expect(page).to have_content("Lawn Mowing & Trimming")
    expect(page).to have_content("Gardening")
    expect(page).to_not have_content("Leaf Clean up")

    fill_in "pro[first_name]", with: "Arnold"
    fill_in "pro[last_name]", with: "Schwarzenegger"
    fill_in "pro[country_code]", with: '1'
    fill_in "pro[phone_number]", with: "8085559111"
    fill_in "pro[zipcode]", with: "79720"
    fill_in "pro[email]", with: "arny22@gmail.com"
    fill_in "pro[password]", with: "hunter2"
    fill_in "pro[password_confirmation]", with: "hunter2"

    click_on "Create Account"

    expect(current_path).to eq(verify_path)

    fill_in "token", with: '123456'

    click_on "Verify Token"

    latest_user = Pro.last
    expect(latest_user.class).to eq Pro

    expect(latest_user.first_name).to eq("Arnold")
    expect(latest_user.last_name).to eq('Schwarzenegger')
    expect(latest_user.email).to eq("arny22@gmail.com")
    expect(latest_user.phone_number).to eq('8085559111')
    expect(latest_user.zipcode).to eq('79720')
    expect(latest_user.services.count).to eq(2)
    expect(latest_user.services.first.name).to eq(service_1.name)
  end


it "can skip authy validation" do
     visit '/'

    click_on "Sign Up"
    expect(current_path).to eq('/choose-account')

    click_on "Join As a Pro"
    expect(current_path).to eq('/pro_register/industries')
    expect(page).to have_css(".industry-choices")

    within ".industry-choices" do
      expect(page).to have_content("Home Improvement")
    end

    click_on "Home Improvement"

    expect(current_path).to eq('/pro_register/home-improvement')
    within ".category-choices" do
      expect(page).to have_content("Lawn & Garden")
    end

    click_on 'Lawn & Garden'

    expect(current_path).to eq('/pro_register/home-improvement/lawn-garden')

    within ".service-choices" do
      expect(page).to have_content("Lawn Mowing & Trimming")
      expect(page).to have_content("Gardening")
      expect(page).to have_content("Leaf Clean Up")
    end
    find(:css, "#service_id_[value='#{service_1.id}']").set(true)
    find(:css, "#service_id_[value='#{service_2.id}']").set(true)
    find(:css, "#service_id_[value='#{service_3.id}']").set(false)

    click_on 'Submit'
    expect(current_path).to eq('/pro/new')

    expect(page).to have_content("Lawn Mowing & Trimming")
    expect(page).to have_content("Gardening")
    expect(page).to_not have_content("Leaf Clean up")

    fill_in "pro[first_name]", with: "Arnold"
    fill_in "pro[last_name]", with: "Schwarzenegger"
    fill_in "pro[country_code]", with: '1'
    fill_in "pro[phone_number]", with: "8085559111"
    fill_in "pro[zipcode]", with: "79720"
    fill_in "pro[email]", with: "arny22@gmail.com"
    fill_in "pro[password]", with: "hunter2"
    fill_in "pro[password_confirmation]", with: "hunter2"

    click_on "Create Account"

    expect(current_path).to eq(verify_path)

    click_button "Skip Validation"

    latest_user = Pro.last
    visit pro_dashboard_index_path


    expect(latest_user.class).to eq Pro
    expect(latest_user.verified).to be false

    expect(latest_user.first_name).to eq("Arnold")
    expect(latest_user.last_name).to eq('Schwarzenegger')
    expect(latest_user.email).to eq("arny22@gmail.com")
    expect(latest_user.phone_number).to eq('8085559111')
    expect(latest_user.zipcode).to eq('79720')
    expect(latest_user.services.count).to eq(2)
    expect(latest_user.services.first.name).to eq(service_1.name)
  end

  it "cannot leave blank fields" do
     visit '/'

    click_on "Sign Up"
    expect(current_path).to eq('/choose-account')

    click_on "Join As a Pro"
    expect(current_path).to eq('/pro_register/industries')
    expect(page).to have_css(".industry-choices")

    within ".industry-choices" do
      expect(page).to have_content("Home Improvement")
    end

    click_on "Home Improvement"

    expect(current_path).to eq('/pro_register/home-improvement')
    within ".category-choices" do
      expect(page).to have_content("Lawn & Garden")
    end

    click_on 'Lawn & Garden'

    expect(current_path).to eq('/pro_register/home-improvement/lawn-garden')

    within ".service-choices" do
      expect(page).to have_content("Lawn Mowing & Trimming")
      expect(page).to have_content("Gardening")
      expect(page).to have_content("Leaf Clean Up")
    end
    find(:css, "#service_id_[value='#{service_1.id}']").set(true)
    find(:css, "#service_id_[value='#{service_2.id}']").set(true)
    find(:css, "#service_id_[value='#{service_3.id}']").set(false)

    click_on 'Submit'
    expect(current_path).to eq('/pro/new')

    expect(page).to have_content("Lawn Mowing & Trimming")
    expect(page).to have_content("Gardening")
    expect(page).to_not have_content("Leaf Clean up")
    click_on "Create Account"

    expect(current_path).to eq('/pro')
    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Zipcode can't be blank")
    expect(page).to have_content("Phone number can't be blank")
    expect(page).to have_content("Country code can't be blank")
    expect(page).to have_content("Lawn Mowing & Trimming")
    expect(page).to have_content("Gardening")
    expect(page).to_not have_content("Leaf Clean up")
  end
end
