class CreateStatustransactions < ActiveRecord::Migration
  def change
    create_table :statustransactions do |t|
      t.string :name

      t.timestamps
    end
  end
end
