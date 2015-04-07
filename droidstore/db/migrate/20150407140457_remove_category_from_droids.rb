class RemoveCategoryFromDroids < ActiveRecord::Migration
  def change
    remove_column :droids, :category, :integer
  end
end
