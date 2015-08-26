class CreateUserMsgs < ActiveRecord::Migration
  def change
    create_table :user_msgs do |t|
      t.integer :user_id
      t.string :msg_content
      t.integer :from_user_id
      #t.integer :to_user_id
      t.integer :msg_check
      t.string :msg_attachment
      
      t.timestamps null: false
    end
  end
end
