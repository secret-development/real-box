class AddFloorAllToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :floorall, :integer
  end
end