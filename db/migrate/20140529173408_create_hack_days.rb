class CreateHackDays < ActiveRecord::Migration
  def change
    create_table :hack_days do |t|
      t.string :title

      t.timestamps
    end
  end
end
