class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :genre, foreign_key: true
      t.string :name, null: false
      t.string :product_image_id, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.boolean :now_on_sale, null: false

      t.timestamps
    end
  end
end
