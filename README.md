# テーブル設計

## users テーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| nickname             | string  | null: false |
| email                | string  | null: false, unique: true |
| encrypted_password   | string  | null: false |
| last_name            | string  | null: false |
| first_name           | string  | null: false |
| last_name_kana       | string  | null: false |
| first_name_kana      | string  | null: false |
| birth_day            | date    | null: false |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type       | Options     |
| ---------------  | ---------- | ----------- |
| name             | string     | null: false |
| description      | string     | null: false |
| category_id      | integer    | null: false |
| condition_id     | integer    | null: false |
| charge_id        | integer    | null: false |
| address_id       | integer    | null: false |
| date_id          | integer    | null: false |
| selling_price    | integer    | null: false |
| user_id          | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order



## order テーブル

| Column           | Type       | Options                        |
| ---------------  | ---------- | -----------------------------  |
| user_id          | integer    | null: false, foreign_key: true |
| item_id          | integer    | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address



## address テーブル

| Column           | Type       | Options     |
| ---------------  | ---------- | ----------- |
| address          | string     | null: false |
| prefecture_id    | integer    | null: false |
| city             | string     | null: false |
| house_number     | string     | null: false |
| building_name    | string     |             |
| phone_number     | string     | null: false |
| order_id         | integer    | null: false, foreign_key: true |


### Association

- belongs_to :order
