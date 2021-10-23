class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  attachment :image
  belongs_to :genre
  has_many :order_details

  def add_tax_price
    price * 1.1
  end


end