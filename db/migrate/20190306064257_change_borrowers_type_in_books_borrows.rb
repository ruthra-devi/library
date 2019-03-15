class ChangeBorrowersTypeInBooksBorrows < ActiveRecord::Migration
  def change
    change_column :books_borrows, :borrowers, :integer
  end
end
