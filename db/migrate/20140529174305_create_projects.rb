class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :description, :null => false
      t.integer :num_votes , default: 0
      t.integer :hack_day_id

      t.timestamps
    end
    add_index :projects, [:hack_day_id, :created_at]
  end
end
