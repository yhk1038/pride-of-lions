class CreateUserAlarms < ActiveRecord::Migration
  def change
    create_table :user_alarms do |t|

      t.timestamps null: false
    end
  end
end
