## テーブル設計

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