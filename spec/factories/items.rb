FactoryBot.define do
  factory :item do      
    
    name   { Faker::Name.name }
    price  { 500 }
    # price  { Faker::Number.between(from: 50, to: 500) }
    category
  end
end
  