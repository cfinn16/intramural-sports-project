class RenamePaid < ActiveRecord::Migration[5.2]
  def change
    rename_column :teams, :paid?, :paid
  end
end
