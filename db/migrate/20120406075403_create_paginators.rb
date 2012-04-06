class CreatePaginators < ActiveRecord::Migration
  def change
    create_table :paginators do |t|

      t.timestamps
    end
  end
end
