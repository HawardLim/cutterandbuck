class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :title_c
      t.string :content
      t.string :content_c
      t.string :news_pic
      t.integer :count
      t.timestamps null: false
    end
  end
end
