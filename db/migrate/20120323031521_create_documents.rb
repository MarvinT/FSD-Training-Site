class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :url

      t.timestamps
    end
  end
end
