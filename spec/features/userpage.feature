# encoding: utf-8
# language: ja
@moviepage
機能: ユーザーページを開く
  シナリオ: 未ログイン時にユーザー1のユーザーページにアクセスする
    もし user のテストデータを作成する
    かつ ユーザー 1 のユーザーページを表示する
    ならば ユーザー 1 のユーザーページが表示されていること

  シナリオ: あるユーザーでログインして、別のユーザーのユーザーページにアクセスする
    もし user のテストデータを作成する
    かつ bookmark_user のテストデータを作成する
    かつ 'bookmark_user@example.com' と 'hogehoge' でログインする
    かつ ユーザー 1 のユーザーページを表示する
    ならば ユーザー 1 のユーザーページが表示されていること
    ならば 要素 'a.bookmark' が 3 個存在すること

  シナリオ: ユーザーページのふせんには動画IDが記載されていること
    もし user のテストデータを作成する
    かつ ユーザー 1 のユーザーページを表示する
    ならば ユーザー 1 のユーザーページが表示されていること
    かつ 要素 '#bookmark li' の 0 番目の要素の内容に '動画ID' が含まれていること

  シナリオ: 存在しないユーザーのユーザーページを表示すると動画検索画面に遷移すること
    もし user のテストデータを作成する
    かつ ユーザー 2 のユーザーページを表示する
    ならば 動画検索画面が表示されていること
    かつ メッセージ 'ユーザーID 2 は存在しません。' が表示されていること

  シナリオ: sm13の再生画面からユーザーページに遷移できる
    もし user のテストデータを作成する
    かつ sm13 の再生画面を表示する
    かつ リンク 'user@example.com' をクリックする
    ならば ユーザー 1 のユーザーページが表示されていること

  シナリオ: userのユーザーページからsm13の動画を見ることができる
    もし user のテストデータを作成する
    かつ ユーザー 1 のユーザーページを表示する
    かつ リンク 'sm13' をクリックする
    ならば sm13 の再生画面が表示されていること

