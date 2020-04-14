FactoryBot.define do
  factory :item do      
    
    name   { Faker::Name.name }
    price  { Faker::Number.between(from: 1, to: 10) }
    category
  end
end
  