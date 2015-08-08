class AddWaiterIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :waiter_id, :integer
  end
end
