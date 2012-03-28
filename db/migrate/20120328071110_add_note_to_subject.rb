class AddNoteToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :note, :text
  end
end