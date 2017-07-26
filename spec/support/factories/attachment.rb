FactoryGirl.define do
  factory :attachment do
    upload {File.new("#{Rails.root}/spec/support/fixtures/image.png")}
  end
end
