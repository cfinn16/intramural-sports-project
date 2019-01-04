class ChangeTableCitiesToCities < ActiveRecord::Migration[5.2]
  def change
    rename_table :table_cities, :cities
  end
end
