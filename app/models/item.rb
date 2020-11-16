class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivary_fee
  belongs_to_active_hash :day_to_ship
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category
    validates :condition
    validates :delivary_fee
    validates :day_to_ship
    validates :prefecture
  end

  with_options numericality: { other_than: 1 } do
    validates :category
    validates :condition
    validates :delivary_fee
    validates :day_to_ship
    validates :prefecture
  end
end
