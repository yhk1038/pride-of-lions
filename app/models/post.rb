class Post < ActiveRecord::Base
    belongs_to :board#, :polymorphic => true
    has_many :comments, :dependent => :destroy
    has_many :user_involves, :as => 'thing', :dependent => :destroy
end
