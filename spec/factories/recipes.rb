FactoryBot.define do
  factory :recipe do
    name              { Faker::Restaurant.name }
    info              { Faker::Restaurant.description }
    category_id       { Faker::Number.between(from: 2, to: 48) }
    cooking_time_id   { Faker::Number.between(from: 2, to: 48) }
    association :user

    after(:build) do |recipe|
      recipe.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
