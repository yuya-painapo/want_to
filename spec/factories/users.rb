require 'factory_girl'

FactoryGirl.define do
  factory :user do
    email "user@test.com"
    password "userpassword"
    password_confirmation "userpassword"
  end

  factory :bookmark_user, class: User do
    email "test@example.com"
    password "hogehoge"
    encrypted_password "$2a$10$8fCNvyqJICPbHRptYKukfejPnEmwl9ISi7gaZ/s33E0nRnTIm4f7O"
  end
end
