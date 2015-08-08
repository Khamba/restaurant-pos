class AddOccupiedToTable < ActiveRecord::Migration
  def change
    add_column :tables, :occupied, :boolean
  end
end
