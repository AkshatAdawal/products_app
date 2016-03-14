class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to :product, index: true, foreign_key: true
      t.string :img_path

      t.timestamps null: false
    end
  end
end
