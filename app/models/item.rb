class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivary_fee
  belongs_to_active_hash :days_to_ship
  belongs_to_active_hash :prefecture

  validates :price, numericality: {
    only_integer: true,
    greater_than: 300,
    less_than_or_equal_to: 9_999_999
  }
  validates :price, format: { with: /\A[0-9]+\z/ }

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :delivary_fee_id
    validates :days_to_ship_id
    validates :prefecture_id
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivary_fee_id
    validates :days_to_ship_id
    validates :prefecture_id
  end

  belongs_to :user
  has_one_attached :image
  has_one :order
end
