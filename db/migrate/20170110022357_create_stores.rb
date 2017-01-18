class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :name_c
      t.string :address
      t.string :address_c
      t.string :phone
      t.string :photo
      t.string :weekday
      t.string :weekend
      t.string :holiday
      t.timestamps null: false
    end
  end
end
