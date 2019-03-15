class CreateBooksBorrows < ActiveRecord::Migration
  def change
    create_table :books_borrows do |t|
      t.string :bname
      t.string :contributors
      t.date :sdate
      t.date :edate
   
      t.timestamps null: false
    end
  end
end
