class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.integer :order
      t.text :description
      t.integer :position
      t.references :comment
      t.timestamps
    end
  end

  def down
    drop_table :lessons # deletes the whole table and all its data!
  end
end
