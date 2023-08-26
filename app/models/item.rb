class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_datelis, dependent: :destroy
  has_many :orders, through: :order_dateils

  has_one_attached :image


  validates :name, presence: true
  validates :explanation, presence: true
  validates :genre, presence: true
  validates :unit_price, presence: true, numericality: {only_integer: true, greater_than: 0}
end