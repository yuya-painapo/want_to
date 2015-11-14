# encoding: utf-8
# language: ja
@mypage
機能: マイページを開く
  シナリオ: マイページを表示する
    もし user のテストデータを作成する
    かつ 'user@test.com' と 'userpassword' でログインする
    かつ マイページを表示する
    ならば マイページが表示されていること
