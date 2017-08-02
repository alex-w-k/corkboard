require 'rails_helper'

feature "User can edit a review for a pro" do
  context "they fill out all required form fields" do
    it "they click edit and fill out the form" do
      category =          create(:category)
      service =           create(:service, category_id: category.id)
      user =              create(:user)
      pro =               create(:pro_user)
      pro_service =       pro.pro_services.create(service: service, pro: pro, radius: 100)
      project1 =          create(:project, service_id: service.id, requester_id: user.id, status: 2)
      bid =               project1.bids.create(user_id: pro.id, amount: "100", comment: "I can help.", status: 1)
      review =            project1.create_review(comment: "This is a test", rating: 5.0, user_id: pro.id)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit project_path(project1)

      within('.review') do
        find('a').click
      end

      within('.review') do
        choose 'review_rating_2'
        fill_in 'review_comment', with: "This is the expected edited comment."
        click_on "Submit"
      end

      expect(current_path).to eq(project_path(project1))
      expect(page).to_not have_selector(".star-rating")
      expect(page).to_not have_field('review_comment')
      expect(page).to have_content("This is the expected edited comment.")
      expect(page).to have_selector('.star-rated', count: 2)
      expect(page).to have_selector('.star-denied', count: 3)
      expect(page).to have_link("Edit")
    end
  end
end

