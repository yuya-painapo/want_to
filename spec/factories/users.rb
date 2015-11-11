require 'factory_girl'

FactoryGirl.define do
  factory :user do
    email "user@test.com"
    password "userpassword"
    password_confirmation "userpassword"
  end
end
