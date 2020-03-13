# Read&Memo

Read&Memoは、読み終えた本の内容を自身で要約し、管理するサービスです。

![スクリーンショット 2020-03-07 12 52 17](https://user-images.githubusercontent.com/57691779/76136355-e0f6d600-6073-11ea-8dee-2083b0052886.png)



# サイトURL
hogehoge



# 主な機能
1.投稿一覧機能


2.投稿詳細表示機能


3.投稿機能

  ・編集機能
  ・削除機能

4.ユーザー登録機能

  ・Eメール、ユーザーネーム、パスワード、画像による登録
  

5.ユーザー編集、削除機能


6.ユーザーログインログアウト機能

  ・上部ヘッダーから登録作業なしでゲストユーザーとしてログイン可能


7.画像ファイルのアップロード機能

  ・画像のサイズは自動で最適化
  
  ・画像指定がない場合、「NoImage」として表示


8.DBテーブルのリレーション管理

  ・ユーザー削除後、自動で該当ユーザーの投稿を削除


9.ページネーション機能



# 使用技術

・言語
Ruby 2.6.3 

・フレームワーク
Ruby on Rails 6.0.2.1

・開発環境
Atom

・本番環境
heroku

・使用技術
GitHub



# 今後取り組んでいく課題
・インフラにAWSを使う

・開発環境と本番環境でdockerを活用

・circleCIでCI/CDを行う
