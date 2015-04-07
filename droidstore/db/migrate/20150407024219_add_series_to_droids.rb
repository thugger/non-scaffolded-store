class AddSeriesToDroids < ActiveRecord::Migration
  def change
    add_column :droids, :series, :string
  end
end
