class Address < ApplicationRecord
  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true

   belongs_to :customer

  def address_all
   "〒" + self.postal_code + " " + self.address + " " + self.name
  end

  def order_address
    self.postal_code + "　" + self.address+ "　" + self.name
  end

end
