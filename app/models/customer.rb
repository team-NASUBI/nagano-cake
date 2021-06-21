class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :carts, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy

  def full_name(customer)
    customer.last_name + customer.first_name
  end

  def self.search(search)
      Customer.where(['id LIKE(?) OR first_name LIKE(?) OR withdrawal_status LIKE(?) OR last_name LIKE(?) OR kana_first_name LIKE(?) OR kana_last_name LIKE(?)',
                       "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
  end

end
