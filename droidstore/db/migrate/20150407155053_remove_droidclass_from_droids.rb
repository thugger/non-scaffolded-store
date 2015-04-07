class RemoveDroidclassFromDroids < ActiveRecord::Migration
  def change
    remove_column :droids, :droidclass, :integer
  end
end
