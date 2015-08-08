class ChangeDateFormatInOrders < ActiveRecord::Migration
  def change
  	change_column :orders, :time, :datetime
  end
end
