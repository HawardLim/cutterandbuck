class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.string :name
      t.string :front_pic
      t.timestamps null: false
    end
  end
end
