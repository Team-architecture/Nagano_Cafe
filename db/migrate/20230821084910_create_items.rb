class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :explanation
      t.integer :unit_price
      t.integer :is_selling_status, default: 0
      


      t.timestamps
    end
  end
end
