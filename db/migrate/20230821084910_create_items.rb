class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :explanation
      t.string :image_id
      t.integer :unit_price
      t.boolean :is_selling_status
      t.boolean :is_active, default: true


      t.timestamps
    end
  end
end
