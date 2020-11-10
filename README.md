## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unipue: true |
| encrypted_password | string | null: false               |
| First_name         | string | null: false               |
| Last_name          | string | null: false               |
| First_name_kana    | string | null: false               |
| Last_name_kana     | string | null: false               |
| birth_date         | date   | null: false               |

### Association
- has_many :items
- has_many :purchased_items



## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| delivary_fee_id | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| days_to_ship_id | integer    | null: false                    |
| price           | integer    | null: false                    |
| user_id         | references | null: false, foregin_key: true |

### Association
- belongs_to :user
- has_one :purcased_item


## purchased_items テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foregin_key: true |
| item_id   | references | null: false, foregin_key: true |

### Association
- belongs_to :item
- has_one :adress
- belongs_to :user


## adresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code_id     | integer    | null: false                    |
| prefecture-id      | integer    | null: false                    |
| adress             | string     | null: false                    |
| building_name      | string     |                     |
| phone_number       | string     | null: false                    |
| purchased_items_id | references | null: false, foregin_key: true |

### Association
- belongs_to :purchased_item

