class User < ActiveRecord::Base
    has_many :myprj_eaches, :dependent => :destroy
    has_many :user_msgs, :dependent => :destroy#, :as => ['to_user', 'from_user']
end
