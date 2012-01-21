class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :typesubject
      t.string :cityname
      t.string :township
      t.string :address
      t.integer :price
      t.integer :numbofrooms
      t.float :square
      t.float :kicthensquare
      t.float :livingsquare
      t.integer :floor
      t.string :typestructure
      t.integer :yearofconstruction
      t.string :telephone
      t.string :furniture
      t.string :internet
      t.string :balcony
      t.string :wc
      t.string :layout
      t.string :state
      t.timestamps
    end
    add_index :subjects, :price
    add_index :subjects, :numbofrooms
    add_index :subjects, :square
  end
end