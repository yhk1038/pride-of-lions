class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.integer :board_id
      t.integer :comment_user_id
      t.string :comment_user_name
      t.string :comment_content
      t.integer :comment_vote
      
      
      t.timestamps null: false
    end
  end
end
