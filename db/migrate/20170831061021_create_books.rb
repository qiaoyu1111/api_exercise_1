class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|

      t.string :juhe_id
      t.string :province
      t.string :book
      t.string :district
      t.string :current_temp
       t.timestamps
     end

    add_index :books, :juhe_id
  end
end
