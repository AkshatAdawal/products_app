class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.date :expiry_date
      t.string :name
      t.string :sku_id
      t.float :price
      t.timestamps null: false
    end
  end
end
