FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.free_email(name.to_s) }
    password { 'somethingverysecret' }
  end
end
