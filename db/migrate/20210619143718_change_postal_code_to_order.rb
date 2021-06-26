class ChangePostalCodeToOrder < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :postal_code, :string
  end
end
