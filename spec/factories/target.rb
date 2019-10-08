require 'faker'

FactoryBot.define do
  factory :target do
    topic
    user
    title     { Faker::Cannabis.buzzword }
    latitude  { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    radius    { Faker::Number.between(from: 1, to: 5000) }
  end
end
