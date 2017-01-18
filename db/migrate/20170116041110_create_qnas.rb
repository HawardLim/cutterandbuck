class CreateQnas < ActiveRecord::Migration
  def change
    create_table :qnas do |t|
      t.string :title
      t.string :content
      t.string :email
      t.string :phone
      t.string :name
      t.string :qna_pic
      t.timestamps null: false
    end
  end
end
