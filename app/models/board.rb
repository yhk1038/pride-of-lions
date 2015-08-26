class Board < ActiveRecord::Base
    has_many :posts, :dependent => :destroy#, :as => 'board'
    has_many :comments, :through => :posts, :dependent => :destroy
end
