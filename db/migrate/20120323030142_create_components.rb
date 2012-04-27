class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.integer :order
      t.references :lesson
      t.string :url
      t.string :type
      t.string :title
      t.timestamps
    end
  end
end
