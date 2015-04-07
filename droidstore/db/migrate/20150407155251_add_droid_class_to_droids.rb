class AddDroidClassToDroids < ActiveRecord::Migration
  def change
    add_reference :droids, :droid_class, index: true
    add_foreign_key :droids, :droid_classes
  end
end
