class Location < ActiveRecord::Base
  attr_accessible :street, :city, :state, :postal_code, :country
  belongs_to :locationable, :polymorphic => true, :dependent => :destroy
end
