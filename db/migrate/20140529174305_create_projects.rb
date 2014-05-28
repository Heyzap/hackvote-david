class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :value
      t.integer :num_votes , default: 0
      t.integer :hack_day_id

      t.timestamps
    end
  end
end
