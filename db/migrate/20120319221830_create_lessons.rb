class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.integer :order
      t.integer :position
      t.text :description
      t.references :comment
      t.timestamps
    end
  end

  def down
    drop_table :lessons # deletes the whole table and all its data!
  end
end
