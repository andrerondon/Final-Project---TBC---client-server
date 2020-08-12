class CreateOrdesProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :ordes_products do |t|
      t.integer :quantaty

      t.timestamps
    end
  end
end
