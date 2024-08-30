# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | -------| ----------- |
| nickname           | string | null:false  |
| email              | string | null:false,unique: true |
| encrypted_password | string | null:false  |
| birthday           | date   | null:false  |
| name               | string | null:false  |

## Association

- has_many :items
- has_many :purchase record

## items テーブル

| Column       | Type        | Options     |
| -------------| ------------| ----------- |
| item_name    | string      | null:false  |
| explanation  | string      | null:false  |
| category     | string      | null:false  |
| situation    | string      | null:false  |
| user         | references  | null: false, foreign_key: true |

## Association

- has_one :purchase record
- belongs_to :user

## purchase record テーブル

| Column       | Type        | Options     |
| -------------| ------------| ----------- |
| user         | references  | null: false, foreign_key: true |

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
