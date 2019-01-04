class CreateTableCities < ActiveRecord::Migration[5.2]
  def change
    create_table :table_cities do |t|
      t.string :name
    end
  end
end
