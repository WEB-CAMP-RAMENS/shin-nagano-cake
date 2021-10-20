class CartItem < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  
  belongs_to :product
  belongs_to :cart
  
  def sum_of_price
    product.price * amount
  end

end
