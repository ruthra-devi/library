class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :bname
      t.string :desc
      t.integer :qty default : 1

      t.timestamps null: false
    end
  end
end
