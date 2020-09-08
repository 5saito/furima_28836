# README

# テーブル設計

## users テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| nickname        | string     | null: false |
| email           | string     | null: false |
| password        | string     | null: false |
| family_name     | string     | null: false |
| first_name      | string     | null: false |
| family_name_kana| string     | null: false |
| first_name_kana | string     | null: false |
| birth_day       | date       | null: false |

### Association

- has_many :items through: items_purchases
<!-- - has_many :purchases -->
- has_many :items_purchases


## items テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| name          | string     | null: false                   |
| text          | text       | null: false,                  |
| price         | integer    | null: false                   |
| category      | integer    | null: false,                  |
| image         | string     | null: false                   |
| prefecture    | integer    | null: false                   |
| condition     | integer    | null: false                   |
| user          | references | null: false, foreign_key: true|
| days          | integer    | null: false,                  |
| delivery_fee  | integer    | null: false,                  |

### Association
- belongs_to :user
- has_one :items_purchase


## items_purchases テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :purchase
- belongs_to :user


## purchases テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post_cord    | string     | null: false                    |
| prefecture   | integer    | null: false                   |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| room_number  | string     | null: false                    |
| phone_number | string     | null: false,                   |
| items_purchase  | references | null: false, foreign_key: true |


### Association
- belongs_to : items_purchase
<!-- - belongs_to :user
- belongs_to :item
- has_one :item  -->






