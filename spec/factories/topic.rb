require 'faker'

FactoryBot.define do
  factory :topic do
    name { Faker::Color.color_name }
  end
end