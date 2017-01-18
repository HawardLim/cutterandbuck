class CreateCataAttachments < ActiveRecord::Migration
  def change
    create_table :cata_attachments do |t|
      t.integer :catalog_id
      t.string :content
      t.timestamps null: false
    end
  end
end
