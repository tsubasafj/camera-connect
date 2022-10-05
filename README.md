# README


# アプリケーション名
Camera Connect

# アプリケーション概要
カメラマンとポートレートモデルを繋ぐSNS

# URL
https://camera-connect.herokuapp.com/

# テスト用アカウント
- Basic認証 
  - ID: admin
  - PASS: 2222
- テスト用ユーザー
  - EMAIL: test@test.com
  - PASS: a11111

# 利用方法
## 新規募集（カメラマンorモデル）
---
1. トップページのヘッダーからユーザー新規登録を行う
2. ヘッダーのPOSTをクリックして募集する内容（タイトル・内容・募集する相手・募集する地域）を入力し投稿する

# アプリケーションを作成した背景
自身の趣味であるところの写真撮影に関するアプリケーションを作成したいと考えたのが始まり。  

写真を共有するSNSは多数存在するが、カメラマンとモデルをマッチングすることを意図していないため、  
マッチングする手段の一つになるアプリケーションを開発することにした。

# 要件定義
https://docs.google.com/spreadsheets/d/1B61RxCOtjn2ClruvVaSGN8cTAwtZPpTDkY1hMsRcqI4/edit?usp=sharing

# 実装予定
現在、投稿機能の実装中。  
  〜今後の実装予定〜
- DM機能
- 写真投稿機能
- コメント機能
- フォロー機能
- いいね!機能

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/bcba0053d50aa1b647869d2fa73af45c.png)](https://gyazo.com/bcba0053d50aa1b647869d2fa73af45c)

# テーブル設計

## users テーブル

| Column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| camera             | string |                           |
| camera_career      | string |                           |
| model_career       | string |                           |

### Association

- has_many :boards
- has_many :rooms, through: :user_rooms
- has_many :user_rooms
- has_many :messages
- has_many :posts
- has_many :comments
- has_many :favorites
- has_many :follower, class_name: "Relationships"
- has_many :followed, class_name: "Relationships"


## boards テーブル

| Column           | Type       | Option                        |
| ---------------- | ---------- | ----------------------------- |
| title            | string     | null: false                   |
| content          | text       | null: false                   |
| want_id          | integer    | null: false                   |
| prefecture_id    | integer    | null: false                   |
| user             | references | null: false foreign_key: true |

### Association

- belongs_to :user


## rooms テーブル

| Column | Type | Option |
| ------ | ---- | ------ |
|        |      |        |  

### Association

- has_many :users, through: :user_rooms
- has_many :messages


## user_rooms テーブル

| Column | Type       | Option                        |
| ------ | ---------- | ----------------------------- |
| user   | references | null: false foreign_key: true |
| room   | references | null: false foreign_key: true |


### Association

- belongs_to :user
- belongs_to :room


## messages テーブル

| Column  | Type       | Option                        |
| ------- | ---------- | ----------------------------- |
| content | string     | null: false                   |
| user    | references | null: false foreign_key: true |
| room    | references | null: false foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room


## posts テーブル

| Column   | Type       | Option                        |
| -------- | ---------- | ----------------------------- |
| content  | text       |                               |
| location | string     |                               |
| user     | references | null: false foreign_key: true |

### Association

- belongs_to :user
- has_many :favorites
- has_many :comments


## comments テーブル

| Column   | Type       | Option                        |
| -------- | ---------- | ----------------------------- |
| content  | string     |                               |
| user     | references | null: false foreign_key: true |
| post     | references | null: false foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post

## favorites テーブル

| Column   | Type       | Option                        |
| -------- | ---------- | ----------------------------- |
| user     | references | null: false foreign_key: true |
| post     | references | null: false foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post


## relationships テーブル

| Column   | Type       | Option                        |
| -------- | ---------- | ----------------------------- |
| follower | references | null: false foreign_key: true |
| followed | references | null: false foreign_key: true |

### Association

- belongs_to :follower, class_name: "User"
- belongs_to :followed, class_name: "User"


# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/f2c2b9e15ea2fa2661658d62ca5d9adc.png)](https://gyazo.com/f2c2b9e15ea2fa2661658d62ca5d9adc)

# 開発環境
- Ruby 2.6.5
- Ruby on Rails 6.0.6
- MySQL 5.6.51
- Rspec
- GitHub
- Heroku
- Visual Studio Code

# ローカルでの動作方法
以下コマンドを順に実行  
% git clone https://camera-connect.herokuapp.com/  
% cd camera-connect  
% bundle install  
% yarn install
