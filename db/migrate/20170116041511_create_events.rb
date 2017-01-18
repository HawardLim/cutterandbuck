class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :title_c
      t.string :content
      t.string :content_C
      t.string :event_pic
      t.integer :count
      t.timestamps null: false
    end
  end
end
