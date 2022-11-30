## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| nickname           | string  | null: false              |
| email              | string  | null: false,unique: true |
| encrypted_password | string  | null: false              |
| last_name          | string  | null: false              |
| first_name         | string  | null: false              |
| last_name_kana     | string  | null: false              |
| first_name_kana    | string  | null: false              |
| birthday           | date    | null: false              |



### Association

- has_many :items
- has_many :orders




## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_name         | string     | null: false                    |
| item_text         | text       | null: false                    |
| item_category_id  | integer    | null: false                    |
| item_condition_id | integer    | null: false                    |
| ship_charge_id    | integer    | null: false                    |
| ship_area_id      | integer    | null: false                    |
| ship_day_id       | integer    | null: false                    |
| item_price        | string     | null: false                    |
| user              | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one    :order



## order テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :orders_informations


## order_informations テーブル

| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| order         | string     | null: false, foreign_key: true |
| post_code     | string     | null: false,                   |
| prefecture    | string     | null: false,                   |
| municipality  | string     | null: false,                   |
| address       | string     | null: false,                   |
| building_name | string     |                                |
| phone_number  | string     | null: false,                   |




### Association

- belongs_to :orders