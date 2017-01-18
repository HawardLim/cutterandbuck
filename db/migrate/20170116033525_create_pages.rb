class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :notes
      t.string :content
      t.text :page
      t.timestamps null: false
    end
  end
end
