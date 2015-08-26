class Comment < ActiveRecord::Base
    belongs_to :post#, :polymorphic => true
    has_many :user_involves, :as => 'thing', :dependent => :destroy
end
