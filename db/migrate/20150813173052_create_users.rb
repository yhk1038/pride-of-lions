class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_email, null: false, default: ""
      t.string :user_name,  null: false, default: ""
      t.integer :user_sex
      t.string :user_team
      t.integer :user_univ
      t.integer :user_icon
      t.integer :user_level
      t.integer :user_exp
      t.string  :user_pic
      t.boolean :user_mailing
      t.boolean :user_open
      t.integer :user_gold
      t.string :user_phone
      
      t.string :user_password, null: false, default: ""
      t.timestamps null: false
    end
  end
end
