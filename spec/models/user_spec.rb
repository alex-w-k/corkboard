require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = create(:user)
    @pro_user = create(:pro_user)
    @service = create(:service)
    @pro_service = @pro_user.pro_services.create(radius: 100, service: @service)
  end

  it 'has a valid factory' do
    expect(@user).to be_valid
  end

  # let(:user) { build(:user) }
  # let(:pro_user) { build(:pro_user) }
  # let(:service) { build(:service) }
  # let(:pro_service) { build(:pro_service, pro: pro_user, service: service)}

  describe 'ActiveModel validations' do
    it { expect(user).to validate_presence_of(:first_name) }
    it { expect(user).to validate_presence_of(:last_name) }
    it { expect(user).to validate_presence_of(:zipcode) }
    it { expect(user).to validate_presence_of(:country_code) }
    it { expect(user).to validate_presence_of(:phone_number) }
    it { expect(user).to validate_presence_of(:email) }
    it { expect(user).to validate_uniqueness_of(:email) }
  end

  describe 'Attributes' do
    it { expect(user).to respond_to(:first_name) }
    it { expect(user).to respond_to(:last_name) }
    it { expect(user).to respond_to(:zipcode) }
    it { expect(user).to respond_to(:country_code) }
    it { expect(user).to respond_to(:phone_number) }
    it { expect(user).to respond_to(:email) }
    it { expect(user).to respond_to(:type) }
  end

  describe 'ActiveRecord Associations' do
    it { expect(@user).to have_many(:user_roles) }
    it { expect(@user).to have_many(:roles) }
    it { expect(@user).to have_many(:requested_projects).with_foreign_key('requester_id') }
    it { expect(@pro_user).to have_many(:pro_services) }
  end
end
