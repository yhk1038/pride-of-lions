class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.integer :navbar_id
      t.string :ltype        
      t.string :url
      t.integer :index
      t.string :icon
      t.string :title
      t.integer :level
      t.timestamps null: false
    end
  end
end
