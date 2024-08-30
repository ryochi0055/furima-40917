# README
# テーブル設計

This README would normally document whatever steps are necessary to get the
application up and running.
## users テーブル

Things you may want to cover:
| Column             | Type   | Options     |
| ------------------ | -------| ----------- |
| nickname           | string | null:false  |
| email              | string | null:false,unique: true |
| encrypted_password | string | null:false  |
| birthday           | date   | null:false  |
| name               | string | null:false  |

* Ruby version
## Association

* System dependencies
- has_many :items
- has_many :purchase record

* Configuration
## items テーブル

* Database creation
| Column       | Type        | Options     |
| -------------| ------------| ----------- |
| item_name    | string      | null:false  |
| explanation  | string      | null:false  |
| category     | string      | null:false  |
| situation    | string      | null:false  |
| user         | references  | null: false, foreign_key: true |

* Database initialization
## Association

* How to run the test suite
- has_one :purchase record
- belongs_to :user

* Services (job queues, cache servers, search engines, etc.)
## purchase record テーブル

* Deployment instructions
| Column       | Type        | Options     |
| -------------| ------------| ----------- |
| user         | references  | null: false, foreign_key: true |

* ...
## Association

- belongs_to :item
- has_one :Shipping information

## Shipping information テーブル

| Column           | Type     | Options     |
| -----------------| ---------| ----------- |
| post_code        | integer  | null: false |
| prefectures      | string   | null: false |
| Municipality     | text     | null: false |
| street address   | text     | null: false |
| building         | text     |
| telephone number | integer  | null: false |

## Association

- belongs_to :purchase record
