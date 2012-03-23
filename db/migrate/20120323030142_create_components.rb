class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.integer :order
      t.references :lesson

      t.timestamps
    end
  end
end
