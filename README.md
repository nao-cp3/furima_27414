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
|birthdate|integer|null: false|
### Association
- has_many :items
- has_many :comments
- has_many :purchases

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|text|string|null: false|
|name|string|null: false|
|category_id|integer|null: false|
|condition_id|integer|null: false|
|postage_id|integer|null: false|
|prefecture_id|integer|null: false|
|several_days_id|integer|null: false|
|prices|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- has_many :comments
- has_one :purchase
- belongs_to :user
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :postage
- belongs_to_active_hash :several_days

## purchaseテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|address_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string||
|telephone|string|null: false|
### Association
- belongs_to :purchase