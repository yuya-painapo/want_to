# coding: utf-8
FactoryGirl.define do
  factory :bookmark_user2_sm9_1, class: Bookmark do
    smid "sm9"
    start_vpos 3000
    comment 'コメントです'

    factory :bookmark_user2_sm9_2, class: Bookmark do
      start_vpos 13000
      comment 'コメント2です'
    end
  end

  factory :bookmark_user1_sm13_1, class: Bookmark do
    smid "sm13"
    start_vpos 3000
    comment 'コメントです'

    factory :bookmark_user2_sm13_1, class: Bookmark do
      comment 'bookmark_sm13_2'
    end
  end
end
