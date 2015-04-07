class AddDroidclassToDroids < ActiveRecord::Migration
  def change
    add_column :droids, :droidclass, :integer
  end
end
