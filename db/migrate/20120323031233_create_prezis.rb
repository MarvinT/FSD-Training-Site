class CreatePrezis < ActiveRecord::Migration
  def change
    create_table :prezis do |t|
      t.string :url

      t.timestamps
    end
  end
end
