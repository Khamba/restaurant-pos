class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :cost
      t.string :type

      t.timestamps null: false
    end
  end
end
