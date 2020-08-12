class CreateOrdes < ActiveRecord::Migration[6.0]
  def change
    create_table :ordes do |t|
      t.date :order_date
      t.string :status

      t.timestamps
    end
  end
end
