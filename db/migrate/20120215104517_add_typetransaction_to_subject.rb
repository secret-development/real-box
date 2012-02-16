class AddTypetransactionToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :typetransaction_id, :integer
  end
end