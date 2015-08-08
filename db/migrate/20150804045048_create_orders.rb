class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :food_id
      t.integer :drink_id
      t.integer :table_id
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end
