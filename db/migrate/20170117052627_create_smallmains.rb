class CreateSmallmains < ActiveRecord::Migration
  def change
    create_table :smallmains do |t|
      t.string :title
      t.string :pic1
      t.string :pic2
      t.string :pic3
      t.string :pic4
      t.timestamps null: false
    end
  end
end
