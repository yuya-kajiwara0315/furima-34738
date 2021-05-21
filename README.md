# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| name       | string | null: false |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| profile    | text   | null: false |
| address    | text   | null: false |
| position   | text   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| title      | string     | null: false |
| catch_copy | text       | null: false |
| concept    | text       | null: false |
| user       | references |             |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| text       | text       | null: false |
| user       | references |             |
| prototype  | references |             |

### Association

- belongs_to :user
- belongs_to :item


## cards テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| text       | text       | null: false |
| user       | references |             |
| prototype  | references |             |

### Association

- belongs_to :user
- belongs_to :item


## deliveries テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| text       | text       | null: false |
| user       | references |             |
| prototype  | references |             |

### Association

- belongs_to :user
- belongs_to :item
