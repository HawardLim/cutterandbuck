class CreatePostAttachments < ActiveRecord::Migration
  def change
    create_table :post_attachments do |t|
      t.integer :post_id
      t.string :avatar
      t.integer :id_of_pic
      t.timestamps null: false
    end
  end
end
