class AddDistrictToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :district_id, :integer
  end
end