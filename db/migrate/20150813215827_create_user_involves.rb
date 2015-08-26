class CreateUserInvolves < ActiveRecord::Migration
  def change
    create_table :user_involves do |t|
      t.integer :thing_id
      t.string :thing_type
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end
