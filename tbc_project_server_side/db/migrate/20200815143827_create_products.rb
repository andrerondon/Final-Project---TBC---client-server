class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.text :description
      t.decimal :price
      t.decimal :subtotal
      t.decimal :total
      t.string :img_url

      t.timestamps
    end
  end
end
