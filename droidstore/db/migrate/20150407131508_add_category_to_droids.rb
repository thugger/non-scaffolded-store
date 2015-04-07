class AddCategoryToDroids < ActiveRecord::Migration
  def change
    add_column :droids, :category, :integer
  end
end
