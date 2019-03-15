class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :books_borrows , :contributors , :borrowers 
  end
end
