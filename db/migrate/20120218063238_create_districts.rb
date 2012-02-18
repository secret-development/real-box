class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.integer :city_id
      t.string :title
      t.index :title
      t.timestamps
    end
  end
end