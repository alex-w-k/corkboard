FactoryGirl.define do

  factory :project do
    status 0
    zipcode 80210
    recurring { Faker::Boolean.boolean }
    timeline 0
    description { Faker::Hipster.paragraph(2) }
    requester
    service
  end
  
end
