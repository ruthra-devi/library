class CreateBooksContributes < ActiveRecord::Migration
  def change
    create_table :books_contributes do |t|
      t.string :bname
      t.string :contributors
      t.timestamps null: false
    end
  end
end
