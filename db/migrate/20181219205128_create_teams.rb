class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.boolean :paid?
      t.integer :league_id

      t.timestamps
    end
  end
end
