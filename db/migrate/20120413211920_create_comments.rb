class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.string :editor
      t.text :body
      t.references :lesson
      t.timestamps
    end
  end

  def down
    drop_table :comments # deletes the whole table and all its data!
  end
end