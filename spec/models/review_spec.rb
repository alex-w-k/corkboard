require 'rails_helper'

RSpec.describe Review, type: :model do
  it "is valid with valid attributes" do
    user = create(:user)
    pro = create(:pro_user)
    project = create(:project, requester_id: user.id, status: 2)
    expect(Review.create(comment: "test", rating: 2, user_id: pro.id, project_id: project.id)).to be_valid
  end

  describe "Relationships" do
    it { should belong_to(:pro) }
    it { should belong_to(:project) }
  end

  describe "Validations" do
    it { should validate_presence_of(:comment) }
    it { should validate_presence_of(:rating) }
  end

  it "returns expected html from star_rated" do
    user = create(:user)
    pro = create(:pro_user)
    project = create(:project, requester_id: user.id, status: 2)
    review = Review.create(comment: "test", rating: 2, user_id: pro.id, project_id: project.id)

    expected_result = "<i class='fa fa-star star-rated' aria-hidden='true'></i><i class='fa fa-star star-rated' aria-hidden='true'></i>"
    expect(review.star_rated).to eq(expected_result)
  end

  it "returns expected html from star_denied" do
    user = create(:user)
    pro = create(:pro_user)
    project = create(:project, requester_id: user.id, status: 2)
    review = Review.create(comment: "test", rating: 4, user_id: pro.id, project_id: project.id)

    expected_result = "<i class='fa fa-star star-denied' aria-hidden='true'></i>"
    expect(review.star_denied).to eq(expected_result)
  end
end
