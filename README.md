# README
# テーブル設計


## users テーブル

| Column             | Type   | Options     |
| ------------------ | -------| ----------- |
| nickname           | string | null:false  |
| email              | string | null:false,unique: true |
| encrypted_password | string | null:false  |
| birthday           | date   | null:false  |
| last_name          | string | null:false  |
| first_name         | string | null:false  |
| last_name_rub      | string | null:false  |
| first_name_rub     | string | null:false  |

## Association

- has_many :items
- has_many :purchase_records

## items テーブル


| Column             | Type        | Options     |
| -------------------| ------------| ----------- |
| item_name          | string      | null:false  |
| explanation        | text        | null:false  |
| category_id        | integer     | null:false  |
| situation_id       | integer     | null:false  |
| Shipping_fee_id    | integer     | null:false  |
| Shipping_source_id | integer     | null:false  |
| Shipping_date_id   | integer     | null:false  |
| user         | references  | null: false, foreign_key: true |

## Association

- has_one :purchase_record
- belongs_to :user


## purchase_records テーブル

| Column       | Type        | Options     |
| -------------| ------------| ----------- |
| user         | references  | null: false, foreign_key: true |
| item         |references  | null: false, foreign_key: true |

## Association

- belongs_to :item
- belongs_to :user
- has_one :Shipping_pieces_of_information

## Shipping_pieces_of_information テーブル

| Column           | Type     | Options     |
| -----------------| ---------| ----------- |
| post_code        | string   | null: false |
| prefecture_id    | integer  | null: false |
| Municipality     | text     | null: false |
| street_address   | text     | null: false |
| building         | text     |
| telephone_number | string   | null: false |
| purchase_record  | references  | null: false, foreign_key: true |
## Association

- belongs_to :purchase_record

