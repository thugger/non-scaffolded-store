class CreateDroids < ActiveRecord::Migration
  def change
    create_table :droids do |t|
      t.string :droid_name
      t.decimal :price

      t.timestamps null: false
    end
  end
end
