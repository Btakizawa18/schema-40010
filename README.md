# アプリケーション名
schedule management

# アプリケーション概要
コンセプトは「転職活動で活用できるアプリ」としてスケジュール管理アプリを作成しました。

スケジュールを投稿することでカレンダー上で投稿した予定を確認することが可能です。

# URL
[オリジナルアプリ](https://schema-40010.onrender.com)

# テスト用アカウント
* Basic認証パスワード： 1192
* Basic認証ID： kamakura

# 利用方法
## スケジュール投稿
1.トップページ（一覧ページ）のヘッダーからユーザー新規登録を行う  
2.トップページの新規投稿ボタンから、予定投稿ページへ遷移する  
3.投稿ページで予定の内容（タイトル名、詳細、目標、日付）を入力して投稿する

## コメント投稿機能
1.トップページ（一覧ページ）のヘッダーからログインページへ遷移しログインを行う  
2.予定詳細ページのコメント投稿枠にコメントを入力して送信ボタンを押す

# 制作背景
プログラミングスクール受講中に転職活動中にも活用できるアプリケーションはないかと考え、家族や知人にヒアリングをした結果、スケジュールを共有でき、コメントが残せるアプリケーションならば
転職活動にも活用できると推測し、スケジュールを投稿しユーザー間でコミュニケーション可能なスケジュール管理アプリの開発をしました。

# 洗い出した要件
[要件定義](https://docs.google.com/spreadsheets/d/1Szl6oZwjmIG_9H3FS8KCtIY3TayJKj1gKJsHdQzP2Rw/edit#gid=982722306)

# 実装予定の機能

# データベース設計
![ER Diagram](./images/test.png)

# 画面遷移図
![ST Diagram](./images/screen.png)

# 開発環境
### フロントエンド
* HTML/CSS

### バックエンド
* Ruby 3.2.0
* Rails 7.0.8

### インフラ
* MySQL
* Render

# ローカルでの動作方法

# 工夫したポイント

# 改善点

# 制作時間

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| profile            | text   | null: false |

### Association

- has_many :plans
- has_many :comments

## plans テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| detail     | text       | null: false                    |
| goal       | string     | null: false                    |
| start_time | datetime   | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column  | Type       | Options                        |
| --------| ---------- | ------------------------------ |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| plan    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :plan
