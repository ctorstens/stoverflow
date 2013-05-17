FactoryGirl.define do
  factory :user do
    sequence(:handle) {|n| "pirate_#{n}"}
    sequence(:email) {|n| "parrot-#{n}@tpb.org" }
    password 'blackbeard'
  end
end
