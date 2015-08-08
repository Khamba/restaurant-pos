class RemoveWaiterIdFromTable < ActiveRecord::Migration
  def change
    remove_column :tables, :waiter_id, :integer
  end
end
