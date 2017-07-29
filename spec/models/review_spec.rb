require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "Relationships" do
    it { should belong_to(:pro) }
    it { should belong_to(:project) }
  end

  describe "Validations" do
    it { should validate_presence_of(:comment) }
    it { should validate_presence_of(:rating) }
  end
end
