FactoryGirl.define do
  factory :category do
    name {Faker::Commerce.department}
    industry
    slug {"#{name.parameterize}"}
  end
end
