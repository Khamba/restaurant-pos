class DropDrinks < ActiveRecord::Migration
   def up
    drop_table :drinks
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
