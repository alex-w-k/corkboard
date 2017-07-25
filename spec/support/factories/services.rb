FactoryGirl.define do
  factory :service do
    name {Faker::Company.profession}
    category
    slug { name.parameterize }
  end
end
