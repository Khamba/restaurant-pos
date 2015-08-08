class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :table_id
      t.datetime :datetime
      t.integer :bill
      t.integer :waiter_id
      t.boolean :finished_eating

      t.timestamps null: false
    end
  end
end
