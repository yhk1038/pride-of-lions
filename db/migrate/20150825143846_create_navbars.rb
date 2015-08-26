class CreateNavbars < ActiveRecord::Migration
  def change
    create_table :navbars do |t|
      t.integer :index
      t.integer :level
      t.string :title
      t.string :style_class
      t.string :ltype    #link, dropdown
      t.string :url
      t.string :icon
      t.integer :xs
      t.integer :sm
      t.integer :md
      t.integer :lg
      t.timestamps null: false
    end
  end
end
