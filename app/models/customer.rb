class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :carts, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy

  
  validates :postal_code, presence: true, length: { is: 7 }
  validates :address, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :kana_first_name, presence: true
  validates :kana_last_name, presence: true
  validates :telephone_number, presence: true
  validates :prefecture_code, presence: true
  
  def full_name(customer)
    customer.last_name + customer.first_name
  end

  def self.search(search)
      Customer.where(['id LIKE(?) OR first_name LIKE(?) OR withdrawal_status LIKE(?) OR last_name LIKE(?) OR kana_first_name LIKE(?) OR kana_last_name LIKE(?)',
                       "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
  end
  
 
end
