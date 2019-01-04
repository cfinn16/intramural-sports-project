class CreateLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :sport
      t.string :day_of_week
      t.integer :cost
      t.string :level

      t.timestamps
    end
  end
end
