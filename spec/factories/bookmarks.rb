# coding: utf-8
FactoryGirl.define do
  factory :bookmark_sm9, class: Bookmark do
    smid "sm9"
    start_vpos 3000
    comment 'コメントです'

    factory :bookmark_sm9_2, class: Bookmark do
      start_vpos 13000
      comment 'コメント2です'
    end
  end

  factory :bookmark_sm13, class: Bookmark do
    smid "sm13"
    start_vpos 3000
    comment 'コメントです'

    factory :bookmark_sm13_2, class: Bookmark do
      comment 'bookmark_sm13_2'
    end
  end
end
