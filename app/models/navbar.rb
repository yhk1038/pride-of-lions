class Navbar < ActiveRecord::Base
    has_many :menus, :dependent => :destroy
    
end
