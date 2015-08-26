class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.integer :level_read
      t.integer :level_list
      t.integer :level_write
      t.integer :level_comment
      t.integer :level_delete
      t.integer :level_modify
      t.integer :level_admin
      t.string :title
      t.string :content
      t.string :flag
      t.integer :position1
      t.integer :position2
      t.string :board_name
      t.timestamps null: false
    end
  end
end
