class CreateValueFields < ActiveRecord::Migration
  def change
    create_table :value_fields do |t|

      t.timestamps
    end
  end
end
