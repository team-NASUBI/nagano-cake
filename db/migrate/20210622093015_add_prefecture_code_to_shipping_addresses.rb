class AddPrefectureCodeToShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :shipping_addresses, :prefecture_code, :string
  end
end
