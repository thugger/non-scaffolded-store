class AddImageToDroids < ActiveRecord::Migration
  def change
    add_column :droids, :image, :string
  end
end
