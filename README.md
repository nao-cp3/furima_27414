# furima DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
|firstname|string|null: false|
|lastname|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|years|integer|null: false|
|month|integer|null: false|
|days|integer|null: false|
### Association
- has_many :items
- has_many :comments

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text||
|text|text||
|item_name|string|null: false|
|categories|string|null: false|
|shopping_burden|string|null: false|
|area|string|null: false|
|several_days|string|null: false|
|prices|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- has_many :comments
- has_many :purchase
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## purchaseテーブル
|Column|Type|Options|
|------|----|-------|
|credit_num|integer|null: false|
|limit_month|integer|null: false|
|limit_year|integer|null: false|
|security_num|integer|null: false|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string||
|telephone|integer|null: false|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item