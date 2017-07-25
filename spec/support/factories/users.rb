FactoryGirl.define do
  factory :user, aliases: [:requester] do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    zipcode { Faker::Address.zip_code }
    password 'hunter2'
    country_code '1'
    phone_number { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email }

    factory :pro_user, aliases: [:pro], class: Pro, parent: :user do
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
      zipcode 80210
      country_code '1'
      phone_number { Faker::PhoneNumber.phone_number }
      email { Faker::Internet.email }
      type "Pro"
      pro_service
    end
  end
end
