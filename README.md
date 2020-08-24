# README

# テーブル設計

## users テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| nickname        | string     | null: false                   |
| email           | string     | null: false                   |
| password        | string     | null: false                   |
| family_name     | string     | null: false                   |
| first_name      | string     | null: false                   |
| family_name_kana| string     | null: false                   |
| first_name_kana | string     | null: false                   |
| birth_day       | date       | null: false, foreign_key: true|

### Association

- has_many :items through: item_purchase
- has_many :purchase
- has_many :items_purchase


## items テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| name          | string     | null: false                   |
| text          | string     | null: false, foreign_key: true|
| price         | integer    | null: false                   |
| category      | integer    | null: false, foreign_key: true|
| image         | string     | null: false                   |
| prefecture    | string     | null: false                   |
| condition     | string     | null: false                   |
| user          | references | null: false, foreign_key: true|
| days          | integer    | null: false, foreign_key: true|
| delivery_fee  | integer    | null: false, foreign_key: true|

### Association
- belongs_to :users
- belongs_to :purchase


## items_purchases テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| items     | references | null: false, foreign_key: true |
| purchase  | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :purchase


## purchases テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| room_number  | string     | null: false                    |
| phone_number | integer    | null: false,                   |
| orders       | references | null: false, foreign_key: true |

### Association

- has_many :users
- has_many :items
- has_many :items through: items_purchase

