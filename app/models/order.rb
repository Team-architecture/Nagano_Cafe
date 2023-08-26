class Order < ApplicationRecord
  has_many :product_orders, dependent: :destory
  belongs_to :public
  
  enum how_to_pay: {
    "クレジットカード" => 0,
    "銀行振込" => 1,
  }
  
  enum status: {
    "入金待ち" => 0,
    "入金確認" => 1,
    "製作中" => 2,
    "発送準備中" => 3,
    "発送済み" =>4,
  }
  
end
