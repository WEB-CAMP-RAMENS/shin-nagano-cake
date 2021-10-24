class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses,dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true


<<<<<<< HEAD
  # --------姓＋名をフルネームにする---------
  def full_name
    self.last_name + self.first_name
  end

# ---------カナ姓＋カナ名をフルネームにする--------

  def kana_full_name
    self.last_name_kana + self.first_name_kana
  end



=======
  def full_name
    last_name + first_name
  end

>>>>>>> dae10db8a615d45c567a12c9d7f8e90648100eac

end
