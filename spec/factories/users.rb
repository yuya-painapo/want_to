require 'factory_girl'

FactoryGirl.define do
  factory :user do
    nickname "test_user"
    email "user@example.com"
    password "userpassword"
    password_confirmation "userpassword"
    after(:create) do |user|
      user.bookmarks << FactoryGirl.create(:bookmark_user1_sm9_1, user: user)
      user.bookmarks << FactoryGirl.create(:bookmark_user1_sm9_2, user: user)
      user.bookmarks << FactoryGirl.create(:bookmark_user1_sm13_1, user: user)
    end
  end

  factory :bookmark_user, class: User do
    nickname "bookmark_test_user"
    email "bookmark_user@example.com"
    password "hogehoge"
    encrypted_password "$2a$10$8fCNvyqJICPbHRptYKukfejPnEmwl9ISi7gaZ/s33E0nRnTIm4f7O"
    after(:create) do |user|
      user.bookmarks << FactoryGirl.create(:bookmark_user2_sm9_1, user: user)
      user.bookmarks << FactoryGirl.create(:bookmark_user2_sm9_2, user: user)
      user.bookmarks << FactoryGirl.create(:bookmark_user2_sm13_1, user: user)
      user.bookmarks << FactoryGirl.create(:bookmark_user2_sm13_2, user: user)
    end
  end
end
