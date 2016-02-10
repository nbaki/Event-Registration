# spec/factories/event_ref.rb
FactoryGirl.define do
  factory :EventRef, class: EventRef do
    id 1
    year 2016
    event_start Date.today
    max_registrants 125
  end
end
