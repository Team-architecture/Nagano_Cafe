class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  enum how_to_pay: { credit_card: 0, transfer: 1 }
  
  enum status: { 
    Awaiting_Payment: 0,
    Payment_Confirmed: 1,
    In_Production: 2,
    Preparing_for_Shipment: 3,
    Shipped: 4
  }
  
end
