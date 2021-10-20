class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
    attachment :image
    belongs_to :genre
end
