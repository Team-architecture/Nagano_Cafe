class Destination < ApplicationRecord
  belongs_to :customer
  validates :name, presence: true
  validates :address, presence: true
  validates :postal_code, presence: true, format: {with: /\A\d{7}\z/}, numericality: { only_integer: true }
  
  def destination_display
    '〒' + postal_code + ' ' + name
  end
end
