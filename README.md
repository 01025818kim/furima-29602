# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| COlumn             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_hurigana     | string | null: false               |
| last_hurigana      | string | null: false               |
| nick_name          | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :buys

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | --------   | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| name               | string     | null: false                    |
| price              | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| state_id           | integer    | null: false                    |
| delivery_fee_id    | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipment_date_id   | integer    | null: false                    |
| comment            | text       | null: false                    |

### Association
- belongs_to :user
- has_one :buy

## buys テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: ture |
| item    | references | null: false, foreign_key: ture |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| buy              | references | null: false, foreign_key: ture |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipality     | string     | null: false                    |
| address_number   | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |

### Association
- belongs_to :buy