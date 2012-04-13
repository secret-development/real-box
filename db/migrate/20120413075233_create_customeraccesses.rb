class CreateCustomeraccesses < ActiveRecord::Migration
  def change
    create_table :customeraccesses do |t|

      t.timestamps
    end
  end
end
