class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
    attachment :image
    belongs_to :genre

  def add_tax_price
    price * 1.1
  end


end