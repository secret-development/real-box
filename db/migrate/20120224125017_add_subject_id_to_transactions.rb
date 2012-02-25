class AddSubjectIdToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :subject_id, :integer
  end
end
