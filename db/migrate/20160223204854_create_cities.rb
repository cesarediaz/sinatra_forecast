class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.text :body
      t.string :city_id
    end
    add_index :cities, :city_id
  end
end
