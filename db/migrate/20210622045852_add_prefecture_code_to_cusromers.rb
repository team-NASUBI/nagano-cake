class AddPrefectureCodeToCusromers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :prefecture_code, :string
  end
end
