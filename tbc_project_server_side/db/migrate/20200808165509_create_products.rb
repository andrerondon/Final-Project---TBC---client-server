class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.text :description
      t.decimal :price
      t.string :img_url

      t.timestamps
    end
  end
end
