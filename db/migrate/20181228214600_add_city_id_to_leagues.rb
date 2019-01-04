class AddCityIdToLeagues < ActiveRecord::Migration[5.2]
  def change
    add_column :leagues, :city_id, :integer
  end
end
