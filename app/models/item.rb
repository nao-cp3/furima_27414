class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :several_day

  has_one_attached :image
  belongs_to :user

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :several_days_id
  end

  validates :text, presence: true
  validates :name, presence: true
  validates :image, presence: true
  validates :prices, presence: true
end
