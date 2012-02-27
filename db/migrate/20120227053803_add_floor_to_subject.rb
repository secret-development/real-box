class AddFloorToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :floor, :integer
  end
end