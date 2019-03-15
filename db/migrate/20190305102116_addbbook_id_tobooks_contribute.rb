class AddbbookIdTobooksContribute < ActiveRecord::Migration
  def change
    add_column :books_contributes, :book_id ,:integer
  end
end
