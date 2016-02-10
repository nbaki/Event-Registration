# spec/factories/registrant.rb
FactoryGirl.define do
  factory :Registrant1, class: Registrant do
    id 1
    year 2016
    first_name 'Test'
    last_name 'First'
    dob Date.today
    email 'test@test.com'
    uuid SecureRandom.urlsafe_base64
  end

  factory :Registrant2, class: Registrant do
    id 2
    year 2016
    first_name 'Test'
    last_name 'Second'
    dob Date.today
    email 'test2@test.com'
    uuid SecureRandom.urlsafe_base64
  end
end
