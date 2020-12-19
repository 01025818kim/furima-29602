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

| COlumn         | Type   | Options     |
| -------------- | ------ | ----------- |
| first_name     | string | null: false |
| last_name      | string | null: false |
| nick_name      | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| birthday_year  | string | null: false |
| birthday_month | string | null: false |
| birthday_date  | string | null: false |

### Association
- has_many :item
- has_many :buys

## items テーブル

| Column          | Type       | Options                        |
| --------------- | --------   | ------------------------------ |
| user_ID         | references | null: false, foreign_key: true |
| item_name       | string     | null: false                    |
| category        | string     | null: false                    |
| state           | string     | null: false                    |
| delivery_fee    | string     | null: false                    |
| shipment_source | string     | null: false                    |
| shipment_date   | string     | null: false                    |
| comment         | string     | null: false                    |

### Association
- belongth_to :user
- has_one :buys

## buys テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_ID | references | null: false, foreign_key: ture |
| item_ID | references | null: false, foreign_key: ture |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| card_information | string | null: false |
| expiration_date  | string | null: false |
| security_code    | string | null: false |
| postal_code      | string | null: false |
| prefectures      | string | null: false |
| municipality     | string | null: false |
| address_number   | string | null: false |
| building_name    | string | null: false |
| phone_number     | string | null: false |

### Association
- belongs_to :buy