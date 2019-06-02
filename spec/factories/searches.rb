FactoryBot.define do
  factory :search do
    keywords { "MyString" }
    street_address { "MyString" }
    state { "MyString" }
    number_of_bathrooms { "MyString" }
    number_of_bedrooms { "MyString" }
    square_footage { "MyString" }
    min_price { "9.99" }
    max_price { "9.99" }
    town { "MyString" }
  end
end
