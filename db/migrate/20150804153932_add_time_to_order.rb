class AddTimeToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :time, :datetime
  end
end
