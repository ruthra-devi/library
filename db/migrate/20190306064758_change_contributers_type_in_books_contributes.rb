class ChangeContributersTypeInBooksContributes < ActiveRecord::Migration
  def change
    change_column :books_contributes, :contributors, :integer
  end
end
