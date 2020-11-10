## users テーブル

| Column           | Type   | Options                   |
| ---------------- | ------ | ------------------------- |
| name             | string | null: false               |
| email            | string | null: false, unipue: true |
| password         | string | null: false               |
| password_conform | string | null: false               |
| First_name       | string | null: false               |
| Last_name        | string | null: false               |
| First_name_kana  | string | null: false               |
| Last_name_kana   | string | null: false               |
| birth_date       | date   | null: false               |

### Association
- has_many :items
- belongs_to :adress
- has_many :purchased_items



## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item_name      | string     | null: false                    |
| description    | text       | null: false                    |
| item_category  | string     | null: false                    |
| item_condition | string     | null: false                    |
| delivary_fee   | integer    | null: false                    |
| prefecture     | stying     | null: false                    |
| days_to_ship   | integer    | null: false                    |
| price          | integer    | null: false                    |
| user_id        | references | null: false, foregin_key: true |

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

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| adress        | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| user_id       | references | null: false, foregin_key: true |

### Association
- belongs_to :purchased_item
- belongs_to :user

