class AddPositionToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :position, :integer
  end
end
