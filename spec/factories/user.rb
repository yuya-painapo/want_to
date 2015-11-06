# coding: utf-8
FactoryGirl.define do
  factory :user do
    email "test@example.com"
    password "hogehoge"
    encrypted_password "$2a$10$8fCNvyqJICPbHRptYKukfejPnEmwl9ISi7gaZ/s33E0nRnTIm4f7O"
  end
end
