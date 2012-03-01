class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :condition
      t.string :value
      t.integer :subject_id
      t.timestamps
    end
  end
end
