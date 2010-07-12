class Location < ActiveRecord::Base
  belongs_to :locationable, :polymorphic => true, :dependent => :destroy
end
