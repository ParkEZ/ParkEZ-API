FactoryBot.define do
  factory :parking_location do
    sequence(:id) { |id| id }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    status { %w(free occupied).sample }
  end
end
