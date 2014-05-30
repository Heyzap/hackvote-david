class CreateHackDays < ActiveRecord::Migration
  def change
    create_table :hack_days do |t|
      t.string :title, :null => false

      t.timestamps
    end
    add_index :hack_days, [:created_at]
  end
end
