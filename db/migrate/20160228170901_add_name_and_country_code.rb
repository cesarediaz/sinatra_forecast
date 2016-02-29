class AddNameAndCountryCode < ActiveRecord::Migration
  def change
    add_column :cities, :name, :string
    add_column :cities, :country_code, :string
  end
end
