class AddColumnToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :prefecture_code, :string
  end
end
