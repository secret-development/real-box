class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :customerphone
    end
  end
end
