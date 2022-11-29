## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | UNIQUE      |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| year               | string | null: false |
| month              | string | null: false |
| day                | string | null: false |



### Association

- has_many :items
- has_many :orders




## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| item_text       | text       | null: false                    |
| item_category   | string     | null: false                    |
| item_condition  | string     | null: false                    |
| shipping_charge | string     | null: false                    |
| shipping_area   | string     | null: false                    |
| days_to_ship    | string     | null: false                    |
| item_price      | string     | null: false                    |
| user            | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- belongs_to :orders



## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| items     | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- belongs_to :orders_information


## orders_information テーブル

| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| buyer         | string     | null: false, foreign_key: true |
| post_code     | string     | null: false, foreign_key: true |
| prefecture    | string     | null: false, foreign_key: true |
| municipality  | string     | null: false, foreign_key: true |
| address       | string     | null: false, foreign_key: true |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false, foreign_key: true |



### Association

- belongs_to :orders