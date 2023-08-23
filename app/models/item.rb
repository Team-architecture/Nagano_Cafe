class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_datelis, dependent: :destroy
  belongs_to :genre
  has_many :orders, thoungh: :order_dateils
  
  attachment :image
  
  def unit_price
    (self.price * 1.1).round
  end
  
  validates :name, presence: true
  validates :explanation, presence: true
  validates :genre, presence: true
  validates :unit_price, presense: true, numericality: {only_integer: true, greater_than: 0}
end
