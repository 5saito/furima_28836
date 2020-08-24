# README

# テーブル設計

## users テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| nickname        | string     | null: false                   |
| email           | string     | null: false                   |
| password        | integer    | null: false                   |
| family_name     | string     | null: false                   |
| first_name      | string     | null: false                   |
| family_name_kana| string     | null: false                   |
| first_name_kana | string     | null: false                   |
| birth_day       | references | null: false, foreign_key: true|
| id              | string     | null: false, foreign_key: true|




## items テーブル

| Column     | Type       | Options                       |
| ---------- | ---------- | ----------------------------- |
| name       | string     | null: false                   |
| price      | integer    | null: false                   |
| category   | references | null: false, foreign_key: true|
| image      | string     | null: false                   |
| prefecture | string     | null: false                   |
| condition  | string     | null: false                   |
| user       | references | null: false, foreign_key: true|

## items_purchase テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| items     | references | null: false, foreign_key: true |
| purchase  | references | null: false, foreign_key: true |

## purchase テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| password     | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |
| post_cord    | integer    | null: false,                   |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| room_number  | string     | null: false                    |
| phone_number | integer    | null: false,                   |
| orders       | references | null: false, foreign_key: true |
