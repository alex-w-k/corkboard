FactoryGirl.define do
  factory :industry do
    name {Faker::Commerce.department}
    slug {"#{name.parameterize}"}
  end
end
