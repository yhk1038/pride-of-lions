class CreateAdminHomes < ActiveRecord::Migration
  def change
    create_table :admin_homes do |t|
      t.string :board_name
      t.integer :board_post
      t.string :board_title
      t.string :board_subtitle
      t.integer :max_length
      t.integer :level
      t.timestamps null: false
    end
  end
end
