class Product < ActiveRecord::Base
  PAYMENT_METHODS = ["Cash", "Check", "Visa", "MasterCard", "AmericanExpress", "Discover", "WireTransfer"]
  PRICE_TYPES = ["negotiable", "starting"]
  belongs_to :shop
  attr_accessible :shop,:name,:title,:description,:expiration_date,:image_link,:link,:payment_accepted,:payment_notes,:pickup,:price,:price_type,:quantity,:location_attributes
  has_one :location, :as => :locationable, :dependent => :destroy
  accepts_nested_attributes_for :location, :allow_destroy => true
end
