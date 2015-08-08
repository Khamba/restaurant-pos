class RemoveDrinksIdFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :drink_id, :integer
  end
end
