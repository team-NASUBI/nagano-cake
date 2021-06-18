class ChangeCloumnsNotnullAddCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column :customers, :reset_password_token, :string, null: false
  end
end
