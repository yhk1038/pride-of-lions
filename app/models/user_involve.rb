class UserInvolve < ActiveRecord::Base
    belongs_to :thing, :polymorphic => true
end
