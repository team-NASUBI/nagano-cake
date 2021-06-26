class ChangeColumnToNullToCustomer < ActiveRecord::Migration[5.2]
  def up
    change_column_null :customers, :reset_password_token, true
  end
  
  def down
    change_column_null :customers, :reset_password_token, false
  end
end
