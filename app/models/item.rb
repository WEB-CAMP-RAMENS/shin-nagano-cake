class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  attachment :image
  belongs_to :genre

  validates :name, presence: true
  validates :image, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

 def add_tax_price
    (self.price*1.10).round
 end


end