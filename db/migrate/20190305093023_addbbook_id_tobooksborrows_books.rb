class AddbbookIdTobooksborrowsBooks < ActiveRecord::Migration
  def change
    add_column :books_borrows, :book_id ,:integer
  end
end
