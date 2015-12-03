# encoding: utf-8
# language: ja
@mypage
機能: マイページを開く
  シナリオ: マイページを表示する
    もし user のテストデータを作成する
    かつ 'test_user' と 'userpassword' でログインする
    かつ マイページを表示する
    ならば マイページが表示されていること

  シナリオ: マイページに自分の付箋一覧が表示されている
    もし bookmark_user のテストデータを作成する
    かつ user のテストデータを作成する
    かつ 'bookmark_test_user' と 'hogehoge' でログインする
    かつ マイページを表示する
    ならば 要素 'a.bookmark' が 4 個存在すること

  シナリオ: ログインしてない状態ではマイページが見られない
    もし bookmark_user のテストデータを作成する
    かつ user のテストデータを作成する
    かつ マイページを表示する
    ならば ログイン画面が表示されていること

  シナリオ: マイページのふせん一覧には動画IDが表示されている
    もし bookmark_user のテストデータを作成する
    かつ 'bookmark_test_user' と 'hogehoge' でログインする
    かつ マイページを表示する
    かつ 要素 '#bookmark li' の 0 番目の要素の内容に '動画ID' が含まれていること

  シナリオ: userのマイページからsm13の動画を見ることができる
    もし user のテストデータを作成する
    かつ 'user@example.com' と 'userpassword' でログインする
    かつ マイページを表示する
    かつ リンク 'sm13' をクリックする
    ならば sm13 の再生画面が表示されていること
    かつ 要素 '#bookmark .success' が存在すること
