FactoryBot.define do
  # 需要依照model名才找的到對應的,或是自己備註class_name
  # factory :user, class_name: Member do
  factory :category do           
    name { Faker::Name.name }
  end
end
  