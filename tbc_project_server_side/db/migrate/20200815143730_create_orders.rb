class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      # t.references :user, foreign_key: true
      t.date :order_date
      t.string :status

      t.timestamps
    end
  end
end
